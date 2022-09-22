import { Component } from "solid-js";

import logo from "@assets/coffee-cup.svg";

import logoStyles from "./logo.module.css";

export const Logo: Component = () => <img src={logo} class={logoStyles.logo} alt="Coffee Cup" />;
