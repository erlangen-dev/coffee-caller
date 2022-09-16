import { delay, map, merge, Observable, of, scan, switchMap, tap } from "rxjs";
import { ReceivedCallMessage } from "./protocol";

export const enum CoffeeCallStatus {
  inactive,
  announced,
  inProgress,
  canceled,
};

export class CoffeeCall {
  status: CoffeeCallStatus = CoffeeCallStatus.inactive;
  participants: Set<string> = new Set();

  constructor(public messages: ReceivedCallMessage[]) {
    if (messages.length === 0) {
      return;
    }

    for (const message of messages) {
      switch (message.type) {
        case 'start':
          this.status = CoffeeCallStatus.inProgress;
          this.participants.add(message.name);
          break;
        case 'join':
          if (this.status !== CoffeeCallStatus.inProgress) {
            this.status = CoffeeCallStatus.announced;
          }
          this.participants.add(message.name);
          break;
        case 'leave':
          this.participants.delete(message.name);
          break;
        default:
          assertUnreachable(message.type);
      }
    }

    if (this.participants.size === 0) {
      this.status = CoffeeCallStatus.canceled;
    }
  }
}

export function aggregatedCoffeeCall(messages: Observable<ReceivedCallMessage>): Observable<CoffeeCall> {
  const reset = 'RESET' as const;
  type Reset = typeof reset;
  const accumulateMessagesUntilReset = (oldMessages: ReceivedCallMessage[], newMessage: ReceivedCallMessage | Reset) =>
    newMessage === reset ? [] : [...oldMessages, newMessage];

  const accumulateMessagesWindowInMs = 3 * 60 * 1000;

  const accumulatedMessagesInTimeWindow = messages.pipe(
    switchMap((message) => {
      const forwardedMessage = of(message);
      const resetSignal = of(reset).pipe(delay(accumulateMessagesWindowInMs));
      return merge(forwardedMessage, resetSignal);
    }),
    scan(accumulateMessagesUntilReset, [] as ReceivedCallMessage[])
  );

  return accumulatedMessagesInTimeWindow.pipe(
    map((messageList) => new CoffeeCall(messageList)) // Todo: this creates a new call for every message
  );
}


function assertUnreachable(x: never): never {
  throw new Error("Didn't expect to get here. Missed case-statement: ", x);
}