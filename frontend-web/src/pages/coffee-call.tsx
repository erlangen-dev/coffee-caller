import { Component, For, Show } from 'solid-js';

import styles from './coffee-call.module.css';
import { getUsername } from '@features/settings';
import { Link } from '@solidjs/router';
import { fromWithDefault } from '../shared/reactivity';
import { aggregatedCoffeeCall, Protocol, SocketClient, CoffeeCall as CoffeeCallObj, CoffeeCallState } from '@features/call-for-coffee';

export const CoffeeCall: Component = () => {
  const client = new SocketClient();
  const protocol = new Protocol(client);

  const username = getUsername();

  const coffeeCall = fromWithDefault(aggregatedCoffeeCall(protocol.messages), new CoffeeCallObj([]));

  return (
    <>
      <div class={styles.buttonRow}>
        <Show
          when={username.trim() !== ''}
          fallback={
            <>
              To participate in calls, set your name first.<br />
              <em>→ <Link href="/settings">Settings</Link></em>
            </>
          }
        >
          <button onClick={() => protocol.join(username)}>Join</button>
          <button onClick={() => protocol.leave(username)}>Leave</button>
          <button onClick={() => protocol.start(username)}>Start</button>
        </Show>
      </div>

      <CoffeeCallState coffeeCall={coffeeCall()} />
    </>
  );
};
