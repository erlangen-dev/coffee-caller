import { catchError, map, Observable } from "rxjs";
import { SocketClient } from "./socket-client";

const messageTypes = ['join', 'leave', 'start'] as const;
type MessageType = typeof messageTypes[number];

export interface CallMessage {
  type: MessageType;
  name: string;
}

export interface RawCallMessage extends CallMessage {
  broadcastAt: string;
}

export interface ReceivedCallMessage extends CallMessage {
  broadcastAt: Date;
}

export class Protocol {
  constructor(private socket: SocketClient) { }

  public get messages(): Observable<ReceivedCallMessage> {
    return this.socket.messages.pipe(
      map(this.parseMessage),
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
    this.socket.send({ name, type });
  }

  private parseMessage(message: RawCallMessage): ReceivedCallMessage {
    if (!messageTypes.includes(message.type) || typeof message.name !== 'string') {
      throw Error('Invalid message');
    }

    return {
      ...message,
      broadcastAt: new Date(message.broadcastAt)
    };
  }
}
