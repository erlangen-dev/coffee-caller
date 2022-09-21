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
    this.sendCommand(name, 'join');
  }

  public leave(name: string) {
    this.sendCommand(name, 'leave');
  }

  public start(name: string) {
    this.sendCommand(name, 'start');
  }

  private sendCommand(name: string, type: CommandTypes) {
    this.socket.send({ name, type });
  }

}
