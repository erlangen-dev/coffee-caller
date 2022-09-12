import { Component, For } from 'solid-js';

import styles from './App.module.css';
import { connect, messages } from './socket-client';

const App: Component = () => {
  connect();

  return (
    <div class={styles.App}>
      <header class={styles.header}>
        <span class={styles.logo}>☕</span>
        <ul>
          <For each={messages()}>{(message) =>
            <li>{message}</li>
          }</For>
        </ul>
      </header>
    </div>
  );
};

export default App;
