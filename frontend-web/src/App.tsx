import { Component, For } from 'solid-js';

import styles from './App.module.css';

import { CoffeeCall } from './coffee-call/coffee-call';

export const App: Component = () => {
  return (
    <div class={styles.App}>
      <header class={styles.header}>
        <span class={styles.logo}>☕</span>
        <CoffeeCall></CoffeeCall>
      </header>
    </div>
  );
};