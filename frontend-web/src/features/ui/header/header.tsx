import { ParentComponent } from "solid-js";

import headerStyles from './header.module.css';

export const Header: ParentComponent = (props) =>
  <header class={headerStyles.header}>
    <h1>Coffee Caller</h1>
    <nav>
      {props.children}
    </nav>
  </header>;
