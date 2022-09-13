import { NavLink, Route, Routes } from '@solidjs/router';
import { Component, For } from 'solid-js';

import styles from './App.module.css';

import { CoffeeCall } from './coffee-call/coffee-call';
import { Header, Logo } from './scaffolding/header-and-logo';
import { Settings } from './settings/settings';

export const App: Component = () => {
  return (
    <div class={styles.App}>
      <Header>
        <NavLink href="/" end={true} >Main</NavLink>
        <NavLink href="/settings">Settings</NavLink>
      </Header>
      <Logo />
      <main>
        <Routes>
          <Route path="/" component={CoffeeCall}/>
          <Route path="/settings" component={Settings}/>
        </Routes>
      </main>
    </div>
  );
};