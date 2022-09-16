import { NavLink, Route, Routes } from '@solidjs/router';
import { Component } from 'solid-js';

import styles from './App.module.css';

import { CoffeeCallPage } from './pages/coffee-call';
import { Header, Logo } from '@features/ui';
import { SettingsPage } from './pages/settings';

export const App: Component = () => (
  <div class={styles.App}>
    <Header>
      <NavLink href="/" end={true} >Main</NavLink>
      <NavLink href="/settings">Settings</NavLink>
    </Header>
    <Logo />
    <main>
      <Routes>
        <Route path="/" component={CoffeeCallPage} />
        <Route path="/settings" component={SettingsPage} />
      </Routes>
    </main>
  </div>
);
