import { Component, For } from 'solid-js';

import styles from './App.module.css';

import CoffeeCall from './coffee-call/coffee-call';

const App: Component = () => {
  return (
    <div class={styles.App}>
      <header class={styles.header}>
        <span class={styles.logo}>☕</span>
        <CoffeeCall></CoffeeCall>
      </header>
    </div>
  );
};

export default App;
