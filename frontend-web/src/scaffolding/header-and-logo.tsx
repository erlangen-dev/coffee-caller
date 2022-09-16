import { Component, ParentComponent } from "solid-js";

import logo from '@assets/coffee-cup.svg';
import logoStyles from './logo.module.css';
import headerStyles from './header.module.css';

export const Header: ParentComponent = (props) =>
  <header class={headerStyles.header}>
    <h1>Coffee Caller</h1>
    <nav>
      {props.children}
    </nav>
  </header>;

export const Logo: Component = () =>
  <img src={logo} class={logoStyles.logo} alt="Coffee Cup" />;