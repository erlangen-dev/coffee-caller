import { io } from 'socket.io-client';
import { createSignal } from 'solid-js';

const event = 'coffee';

type message = string;

export const [messages, setMessages] = createSignal<message[]>([]);

export function connect() {
    const socket = io('ws://localhost:4200');

    socket.on('connect', () => {
        console.log('Socket.io connection established');

        window.setTimeout(() => {
            socket.emit(event, 'hello');
        }, 1000);
    });

    socket.on('disconnect', () => {
        console.log('Socket.io connection closed');
    });

    socket.on(event, (data) => {
        console.log('Coffee message received:', data);
        setMessages([...messages(), data]);
    });

}
