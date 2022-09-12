import { Accessor, createMemo } from "solid-js";
import { SocketClient } from "./socket-client";

const messageTypes = ['join', 'leave', 'start'] as const;
type MessageType = typeof messageTypes[number];

export interface CallMessage {
  type: MessageType;
  name: string;
}

export class Protocol {
  constructor(private socket: SocketClient) { }

  public get messages(): Accessor<CallMessage[]> {
    return createMemo(
      () =>
        this.socket
          .messages()
          .map(this.parseRawMessage)
          .filter((elem) => elem !== null) as CallMessage[]
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
    this.socket.send(JSON.stringify({name, type}));
  }

  private parseRawMessage(rawMessage: string): CallMessage | null {
    try {
      const parsedMessage = JSON.parse(rawMessage);

      if (!messageTypes.includes(parsedMessage.type) || typeof parsedMessage.name !== 'string') {
        console.warn('Invalid message received:', rawMessage);
        return null;
      }

      return parsedMessage;
    } catch (e) {
      console.warn('Could not parse message', e);
      return null;
    }
  }

}