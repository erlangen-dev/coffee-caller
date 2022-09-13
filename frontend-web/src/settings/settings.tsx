import { Component, createEffect, createSignal, For, Show } from 'solid-js';
import * as storage from './persistence';

import style from './settings.module.css';

export const Settings: Component = () => {
  const [username, setUsername] = createSignal(storage.getUsername());
  const [usernameStored, setUsernameStored] = createSignal(false);

  let storageTimeout: number | undefined;
  function handleInput(event: InputEvent) {
    setUsernameStored(false);

    clearTimeout(storageTimeout);
    storageTimeout = window.setTimeout(
      () => {
        storage.storeUsername((event.target as HTMLInputElement).value);
        setUsername(storage.getUsername());
        setUsernameStored(true);
      },
      800
    );
  }

  return <label>
    Username:
    <input type="text" name="username" value={username()} onInput={handleInput} />
    <Show when={usernameStored()}><span class={style.confirm}>✓</span></Show> 
  </label>;
}