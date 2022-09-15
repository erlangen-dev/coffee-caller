import { catchError, map, Observable } from "rxjs";
import { SocketClient } from "./socket-client";

const messageTypes = ['join', 'leave', 'start'] as const;
type MessageType = typeof messageTypes[number];

export interface CallMessage {
  type: MessageType;
  name: string;
}

export class Protocol {
  constructor(private socket: SocketClient) { }

  public get messages(): Observable<CallMessage> {
    return this.socket.messages.pipe(
      map(this.parseRawMessage),
      catchError((err, source) => {
        console.warn('Skipping a message. Could not parse message:', err);
        return source;
      })
    );
  }

  public join(name: string) {
    this.sendEvent(name, 'join');
  }

  public leave(name: string) {
    this.sendEvent(name, 'leave');
  }

  public start(name: string) {
    this.sendEvent(name, 'start');
  }

  private sendEvent(name: string, type: MessageType) {
    this.socket.send(JSON.stringify({ name, type }));
  }

  private parseRawMessage(rawMessage: string): CallMessage {
    const parsedMessage = JSON.parse(rawMessage);

    if (!messageTypes.includes(parsedMessage.type) || typeof parsedMessage.name !== 'string') {
      throw Error('Invalid message');
    }

    return parsedMessage;
  }
}
