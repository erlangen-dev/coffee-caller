import { createServer } from "http";
import { Server, Socket } from "socket.io";
import { shareReplay, Subject, take, timeout, } from "rxjs";

import { CoffeeCall, Command, TimedCommand } from "./models";
import { getAllowedCorsOrigins, getServerListeningPort } from "./environment";
import { convertCommandsToCalls } from "./message-pipeline";

type VoidListener<T> = (event: T) => void;
type CoffeeCallerEventsMap = { coffee: VoidListener<TimedCommand>, coffeeCalls: VoidListener<CoffeeCall> };

const httpServer = createServer();
const io = new Server<CoffeeCallerEventsMap>(httpServer, {
    cors: {
        origin: getAllowedCorsOrigins(),
        methods: ["GET", "POST"]
    }
});

const messageSubject = new Subject<Command>();
const processedCoffeeCalls = messageSubject.pipe(convertCommandsToCalls);

function broadcastCommand(command: Command) {
    const timed = { ...command, broadcastAt: new Date() };
    console.log('→ broadcast command msg:', timed);
    io.sockets.emit("coffee", timed);
}

function logCommand(command: Command) {
    console.log('← received command msg:', command);
}

function putCommandIntoPipeline(command: Command) {
    messageSubject.next(command);
}

io.on("connection", (socket) => {
    console.log(`Got new connection: ${socket.id}`);

    socket.on("coffee", logCommand);
    socket.on("coffee", broadcastCommand)
    socket.on("coffee", putCommandIntoPipeline);

    processedCoffeeCalls.subscribe((coffeeCall) => socket.emit("coffeeCalls", coffeeCall));
});

const port = getServerListeningPort();
httpServer.listen(port);
console.log(`Server running on port: ${port}`);
