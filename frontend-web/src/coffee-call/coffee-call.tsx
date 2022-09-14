import { Component, For } from 'solid-js';

import styles from './coffee-call.module.css';
import { SocketClient } from './socket-client';
import { Protocol } from './protocol';
import { getUsername } from '../shared/persistence';

export const CoffeeCall: Component = () => {
  const client = new SocketClient();
  const protocol = new Protocol(client);

  return (
    <>
      <div class={styles.buttonRow}>
        <button onClick={() => protocol.join(getUsername())}>Join</button>
        <button onClick={() => protocol.leave(getUsername())}>Leave</button>
        <button onClick={() => protocol.start(getUsername())}>Start</button>
      </div>
      <ul>
        <For each={protocol.messages()}>{(message) =>
          <li>{message.name} {message.type}s a coffee call</li>
        }</For>
      </ul>
    </>
  );
};

