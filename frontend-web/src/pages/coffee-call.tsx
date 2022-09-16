import { Component, For, Show } from 'solid-js';

import { getUsername } from '@features/settings';
import { fromWithDefault } from '../shared/reactivity';
import { aggregatedCoffeeCall, Protocol, SocketClient, CoffeeCall as CoffeeCallObj, CoffeeCallState, ButtonRow } from '@features/call-for-coffee';

export const CoffeeCall: Component = () => {
  const client = new SocketClient();
  const protocol = new Protocol(client);

  const username = getUsername(); // TODO: This is not reactive!

  const coffeeCall = fromWithDefault(aggregatedCoffeeCall(protocol.messages), new CoffeeCallObj([]));

  return (
    <>
      <ButtonRow
        usernameIsSet={username.trim() !== ''}
        joinClicked={() => protocol.join(username)}
        leaveClicked={() => protocol.leave(username)}
        startClicked={() => protocol.start(username)}
      />

      <CoffeeCallState coffeeCall={coffeeCall()} />
    </>
  );
};
