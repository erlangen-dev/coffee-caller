import { NavLink, Route, Routes } from '@solidjs/router';
import { Component, For } from 'solid-js';

import styles from './App.module.css';

import { CoffeeCall } from './coffee-call/coffee-call';
import { Settings } from './settings/settings';

export const App: Component = () => {
  return (
    <div class={styles.App}>
      <header class={styles.header}>
        <span class={styles.logo}>☕</span>
        <nav>
          <NavLink href="/" end={true} >Main</NavLink>
          <NavLink href="/settings">Settings</NavLink>
        </nav>
      </header>
      <main>
        <Routes>
          <Route path="/" component={CoffeeCall}/>
          <Route path="/settings" component={Settings}/>
        </Routes>
      </main>
    </div>
  );
};