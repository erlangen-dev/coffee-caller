import { Component, For } from 'solid-js';

import logo from './logo.svg';
import styles from './App.module.css';
import { connect, messages } from './socket-client';

const App: Component = () => {
  connect();

  return (
    <div class={styles.App}>
      <header class={styles.header}>
        <img src={logo} class={styles.logo} alt="logo" />
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
