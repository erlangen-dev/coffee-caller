import { Accessor, Component, createEffect, createMemo, For, from, Show } from 'solid-js';

import styles from './coffee-call.module.css';
import { SocketClient } from './socket-client';
import { Protocol } from './protocol';
import { getUsername } from '../shared/persistence';
import { Link } from '@solidjs/router';
import { aggregatedCoffeeCall, CoffeeCallState, CoffeeCall as CoffeeCallObj } from './call-aggregation';

export const CoffeeCall: Component = () => {
  const client = new SocketClient();
  const protocol = new Protocol(client);

  const username = getUsername();

  const coffeeCall = from(aggregatedCoffeeCall(protocol.messages));
  const participantsAsList = () => Array.from(coffeeCall()?.participants.values() ?? []).join(',');

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

      <Show when={coffeeCall()?.state === CoffeeCallState.announced}>Coffee call announced!</Show>
      <Show when={coffeeCall()?.state === CoffeeCallState.inProgress}>Coffee call in progress!</Show>
      <Show when={coffeeCall()?.state === CoffeeCallState.canceled}>Coffee call canceled!</Show>

      <Show when={coffeeCall() && coffeeCall()?.state !== CoffeeCallState.inactive && coffeeCall()?.state !== CoffeeCallState.canceled}>
        On board: {participantsAsList()}
      </Show>
      <ul>
        <For each={coffeeCall()?.messages}>{(message) =>
          <li>{message.name} {message.type}s a coffee call @{message.broadcastAt.toLocaleString()}</li>
        }</For>
      </ul >
    </>
  );
};