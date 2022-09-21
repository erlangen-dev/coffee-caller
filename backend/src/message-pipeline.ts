import { delay, map, merge, Observable, of, scan, switchMap } from "rxjs";
import { getCallDurationInSeconds } from "./environment";
import { CoffeeCallStatus, TimedCommand, CoffeeCall, Command } from "./models";

class AggregatedCoffeeCall implements CoffeeCall {
  status: CoffeeCallStatus = 'inactive';
  participants: string[] = [];

  constructor(public messages: TimedCommand[]) {
    if (messages.length === 0) {
      return;
    }

    const participants = new Set<string>();
    for (const message of messages) {
      switch (message.type) {
        case 'start':
          this.status = 'inProgress';
          participants.add(message.name);
          break;
        case 'join':
          if (this.status !== 'inProgress') {
            this.status = 'announced';
          }
          participants.add(message.name);
          break;
        case 'leave':
          participants.delete(message.name);
          break;
        default:
          assertUnreachable(message.type);
      }
    }

    if (participants.size === 0) {
      this.status = 'cancelled';
    }

    this.participants = Array.from(participants.values());
  }
}

export function convertCommandsToCalls(commands: Observable<Command>) {
  return commands.pipe(
    addTimeStampToCommands,
    aggregateCoffeeCalls
  )
}

function addTimeStampToCommands(commands: Observable<Command>): Observable<TimedCommand> {
  return map(
    (incomingMessage: Command): TimedCommand => {
      return ({ ...incomingMessage, broadcastAt: new Date() })
    }
  )(commands);
}

function aggregateCoffeeCalls(messages: Observable<TimedCommand>): Observable<AggregatedCoffeeCall> {
  const reset = 'RESET' as const;
  type Reset = typeof reset;
  const accumulateMessagesUntilReset = (oldMessages: TimedCommand[], newMessage: TimedCommand | Reset) =>
    newMessage === reset ? [] : [...oldMessages, newMessage];

  const accumulateMessagesWindowInMs = getCallDurationInSeconds() * 1000;

  const accumulatedMessagesInTimeWindow = messages.pipe(
    switchMap((message) => {
      const forwardedMessage = of(message);
      const resetSignal = of(reset).pipe(delay(accumulateMessagesWindowInMs));
      return merge(forwardedMessage, resetSignal);
    }),
    scan(accumulateMessagesUntilReset, [] as TimedCommand[])
  );

  return accumulatedMessagesInTimeWindow.pipe(
    map((messageList) => new AggregatedCoffeeCall(messageList))
  );
}


function assertUnreachable(x: never): never {
  throw new Error("Didn't expect to get here. Missed case-statement: " + x);
}