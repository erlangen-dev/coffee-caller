import { Observable, Subject } from 'rxjs';
import { io, Socket } from 'socket.io-client';
import { CoffeeCall, Command } from './models';

export class SocketClient {
    private socket: Socket | undefined;
    private messageSubject = new Subject<CoffeeCall>();

    constructor() {
        this.connect();
    }

    public get messages(): Observable<CoffeeCall> {
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

        this.socket.on('coffeeCalls', (data) => {
            console.log('Coffee call update received:', data);
            this.messageSubject.next(data);
        });
    }

    public send(command: Command) {
        assertConnected(this.socket);
        this.socket.emit('coffee', command);
    }
}

function assertConnected(socket: Socket | undefined): asserts socket is Socket {
    if (socket === undefined) {
        throw Error('Not connected');
    }
}