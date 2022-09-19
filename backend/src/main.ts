import * as dotenv from "dotenv";
dotenv.config();

import { createServer } from "http";
import { Server } from "socket.io";

const httpServer = createServer();
const io = new Server(httpServer, {
    cors: {
        origin: process.env.CORS_ALLOWED_ORIGIN || 'http://localhost:3000',
        methods: ["GET", "POST"]
    }
});

io.on("connection", (socket) => {
    console.log(`Got new connection: ${socket.id}`);

    socket.on("coffee", (messageIn) => {
        console.log('← receivced msg:', messageIn);
        const messageOut = {
            ...messageIn,
            broadcastAt: new Date().toISOString()
        };
        console.log('→ broadcast msg:', messageOut);
        io.sockets.emit("coffee", messageOut);
    });
});

const port = process.env.PORT || 4200;
httpServer.listen(port);
console.log(`Server running on port: ${port}`);
