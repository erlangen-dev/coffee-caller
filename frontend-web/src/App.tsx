import { Component, createMemo, For } from 'solid-js';

import styles from './App.module.css';
import { SocketClient } from './socket-client';
import { Protocol } from './protocol';

const App: Component = () => {
  const client = new SocketClient();
  const protocol = new Protocol(client);

  return (
    <div class={styles.App}>
      <header class={styles.header}>
        <span class={styles.logo}>☕</span>
        <ul>
          <For each={protocol.messages()}>{(message) =>
            <li>{message.name} {message.type}s a coffee call</li>
          }</For>
        </ul>
      </header>
    </div>
  );
};

export default App;
