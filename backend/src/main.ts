import { createServer } from "http";
import { Server } from "socket.io";
import { Subject, } from "rxjs";

import { Command } from "./models";
import { getAllowedCorsOrigins, getServerListeningPort } from "./environment";
import { convertCommandsToCalls } from "./message-pipeline";

const httpServer = createServer();
const io = new Server(httpServer, {
    cors: {
        origin: getAllowedCorsOrigins(),
        methods: ["GET", "POST"]
    }
});

io.on("connection", (socket) => {
    console.log(`Got new connection: ${socket.id}`);
    socket.on("coffee", (commandIn: Command) => {
        console.log('← received command msg:', commandIn);
        console.log('→ broadcast command msg:', { ...commandIn, broadcastAt: new Date() });
        io.sockets.emit("coffee", commandIn);
        messageSubject.next(commandIn);
    });
});

const messageSubject = new Subject<Command>();
const coffeeCalls = convertCommandsToCalls(messageSubject);
coffeeCalls.subscribe((coffeeCall) => {
    console.log('→ broadcast coffeeCall msg:', coffeeCall);
    io.sockets.emit("coffeeCalls", coffeeCall);
});

const port = getServerListeningPort();
httpServer.listen(port);
console.log(`Server running on port: ${port}`);
