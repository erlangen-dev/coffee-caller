import { Component, createMemo, For, from, Show } from 'solid-js';

import styles from './coffee-call.module.css';
import { SocketClient } from './socket-client';
import { CallMessage, Protocol } from './protocol';
import { getUsername } from '../shared/persistence';
import { Link } from '@solidjs/router';

export const CoffeeCall: Component = () => {
  const client = new SocketClient();
  const protocol = new Protocol(client);

  const username = getUsername();

  const newestMessage = from(protocol.messages);
  const allMessages = createMemo((oldValue: CallMessage[]) => {
    const actualNewMessage = newestMessage();
    return actualNewMessage === undefined ? [...oldValue] : [...oldValue, actualNewMessage]
  }, []);

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
      <ul>
        <For each={allMessages()}>{(message) =>
          <li>{message.name} {message.type}s a coffee call</li>
        }</For>
      </ul>
    </>
  );
};
