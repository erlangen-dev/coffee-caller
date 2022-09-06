import * as dotenv from "dotenv";
dotenv.config();

import { createServer } from "http";
import { Server } from "socket.io";

const httpServer = createServer();
const io = new Server(httpServer);

io.on("connection", (socket) => {
    console.log(`Got new connection: ${socket.id}`);
    socket.on("coffee", (data) => {
        io.sockets.emit("coffee", "Lets go");
    });
});

const port = process.env.PORT || 4200;
httpServer.listen(port);
console.log(`Server running on port: ${port}`);
