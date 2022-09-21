import { catchError, Observable } from "rxjs";
import { CoffeeCall, CommandTypes } from "./models";
import { SocketClient } from "./socket-client";

export class Protocol {
  constructor(private socket: SocketClient) { }

  public get messages(): Observable<CoffeeCall> {
    return this.socket.messages.pipe(
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

}
