import { Observable, Subject } from 'rxjs';
import { io, Socket } from 'socket.io-client';
import { RawCallMessage } from './protocol';

const event = 'coffee';

export class SocketClient {
    private socket: Socket | undefined;

    constructor(private messageSubject = new Subject<RawCallMessage>()) {
        this.connect();
    }

    public get messages(): Observable<RawCallMessage> {
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

    public send(obj: object) {
        assertConnected(this.socket);
        this.socket.emit(event, obj);
    }
}

function assertConnected(socket: Socket | undefined): asserts socket is Socket {
    if (socket === undefined) {
        throw Error('Not connected');
    }
}