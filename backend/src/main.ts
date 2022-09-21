import { createServer } from "http";
import { Server } from "socket.io";
import { getAllowedCorsOrigins, getServerListeningPort } from "./environment";

const httpServer = createServer();
const io = new Server(httpServer, {
    cors: {
        origin: getAllowedCorsOrigins(),
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

const port = getServerListeningPort();
httpServer.listen(port);
console.log(`Server running on port: ${port}`);
