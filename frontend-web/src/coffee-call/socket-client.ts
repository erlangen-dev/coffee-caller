import { Observable, Subject } from 'rxjs';
import { io, Socket } from 'socket.io-client';

const event = 'coffee';

export class SocketClient {
    private socket: Socket | undefined;

    constructor(private messageSubject = new Subject<string>()) {
        this.connect();
    }

    public get messages(): Observable<string> {
        return this.messageSubject.asObservable();
    }

    private connect() {
        this.socket = io('ws://localhost:4200');

        this.socket.on('connect', () => {
            console.log('Socket.io connection established');
        });

        this.socket.on('disconnect', () => {
            console.log('Socket.io connection closed');
        });

        this.socket.on(event, (data) => {
            console.log('Coffee message received:', data);
            this.messageSubject.next(data);
        });
    }

    public send(message: string) {
        assertConnected(this.socket);
        this.socket.emit(event, message);
    }
}

function assertConnected(socket: Socket | undefined): asserts socket is Socket {
    if (socket === undefined) {
        throw Error('Not connected');
    }
}