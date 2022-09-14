import { Component, createMemo, For, from, Show } from 'solid-js';

import styles from './coffee-call.module.css';
import { SocketClient } from './socket-client';
import { Protocol, ReceivedCallMessage } from './protocol';
import { getUsername } from '../shared/persistence';
import { Link } from '@solidjs/router';

export const CoffeeCall: Component = () => {
  const client = new SocketClient();
  const protocol = new Protocol(client);

  const username = getUsername();

  const messageSignal = from(protocol.messages);
  const messages = createMemo((existingMessages: ReceivedCallMessage[]) => {
    const message = messageSignal();
    return message === undefined ? existingMessages : [...existingMessages, message]
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
        <For each={messages()}>{(message) =>
          <li>{message.name} {message.type}s a coffee call @{message.broadcastAt.toLocaleString()} </li>
        }</For>
      </ul>
    </>
  );
};
