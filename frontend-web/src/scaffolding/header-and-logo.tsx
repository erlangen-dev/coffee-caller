import { Component, ParentComponent } from "solid-js";


import logoStyles from './logo.module.css';
import headerStyles from './header.module.css';

export const Header: ParentComponent = (props) =>
  <header class={headerStyles.header}>
    <h1>CoffeeCaller</h1>
    <nav>
      {props.children}
    </nav>
  </header>;

export const Logo: Component = () =>
  <span class={logoStyles.logo}>☕</span>