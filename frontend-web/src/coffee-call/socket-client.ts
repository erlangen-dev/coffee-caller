import { io, Socket } from 'socket.io-client';
import { Accessor, createSignal, Setter } from 'solid-js';

const event = 'coffee';

export class SocketClient {
    private socket: Socket | undefined;

    constructor(private signal = createSignal<string[]>([])) {
        this.connect();
    }

    public get messages(): Accessor<string[]> {
        return this.signal[0];
    }

    private get setMessages(): Setter<string[]> {
        return this.signal[1];
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
            this.setMessages([...this.messages(), data]);
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