import { Accessor, createMemo } from "solid-js";
import { SocketClient } from "./socket-client";

const messageTypes = ['join', 'leave', 'start'] as const;

export interface CallMessage {
  type: typeof messageTypes[number];
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

  public join(name: string, client: SocketClient) {
    client.send({ type: 'join', name });
  }

  public leave(name: string, client: SocketClient) {
    client.send({ type: 'leave', name });
  }

  public start(name: string, client: SocketClient) {
    client.send({ type: 'start', name });
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