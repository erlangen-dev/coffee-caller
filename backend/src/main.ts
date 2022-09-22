import { createServer } from "http";
import { shareReplay, Subject } from "rxjs";
import { Server } from "socket.io";

import { getAllowedCorsOrigins, getServerListeningPort } from "./environment";
import { convertCommandsToCalls } from "./message-pipeline";
import { CoffeeCall, Command, TimedCommand } from "./models";

type VoidListener<T> = (event: T) => void;
type CoffeeCallerEventsMap = {
  coffeeRequest: VoidListener<TimedCommand>;
  coffeeCall: VoidListener<CoffeeCall>;
};

const httpServer = createServer();
const io = new Server<CoffeeCallerEventsMap>(httpServer, {
  cors: {
    origin: getAllowedCorsOrigins(),
    methods: ["GET", "POST"],
  },
});

const messageSubject = new Subject<Command>();
const processedCoffeeCalls = messageSubject.pipe(convertCommandsToCalls, shareReplay(1));

function logCommand(command: Command) {
  console.log("← received command msg:", command);
}

function putCommandIntoPipeline(command: Command) {
  messageSubject.next(command);
}

io.on("connection", (socket) => {
  console.log(`Got new connection: ${socket.id}`);

  socket.on("coffeeRequest", logCommand);
  socket.on("coffeeRequest", putCommandIntoPipeline);

  processedCoffeeCalls.subscribe((coffeeCall) => socket.emit("coffeeCall", coffeeCall));
});

const port = getServerListeningPort();
httpServer.listen(port);
console.log(`Server running on port: ${port}`);
