import { Component } from "solid-js";

import {
  ButtonRow,
  CoffeeCallState,
  emptyCoffeeCall,
  Protocol,
  SocketClient,
} from "@features/call-for-coffee";
import { getUsername } from "@features/settings";

import { fromWithDefault } from "../shared/reactivity";

export const CoffeeCallPage: Component = () => {
  const client = new SocketClient();
  const protocol = new Protocol(client);

  const username = getUsername(); // TODO: This is not reactive!

  const coffeeCall = fromWithDefault(protocol.messages, emptyCoffeeCall);

  return (
    <>
      <ButtonRow
        usernameIsSet={username.trim() !== ""}
        joinClicked={() => protocol.join(username)}
        leaveClicked={() => protocol.leave(username)}
        startClicked={() => protocol.start(username)}
      />

      <CoffeeCallState coffeeCall={coffeeCall()} />
    </>
  );
};
