import { Component, createSignal, Show } from 'solid-js';
import * as storage from '../shared/persistence';

import style from './settings.module.css';

export const Settings: Component = () => (
  <DelayedStoringInput
    label="Name"
    storeValue={storage.storeUsername}
    getValue={storage.getUsername}
  />
);

type DelayedStoringInputProps = {
  label: string,
  storeValue: (value: string) => void,
  getValue: () => string, storeDelayInMs?: number
};

const DelayedStoringInput: Component<DelayedStoringInputProps> = (props) => {
  const [value, setValue] = createSignal(props.getValue());
  const [valueStored, setValueStored] = createSignal(false);

  let storageTimeout: number | undefined;
  function handleInput(event: InputEvent) {
    setValueStored(false);

    clearTimeout(storageTimeout);
    storageTimeout = window.setTimeout(
      () => {
        const value = (event.target as HTMLInputElement).value.trim();
        if (value === '') { return; }
        props.storeValue(value);
        setValue(props.getValue());
        setValueStored(true);
      },
      props.storeDelayInMs ?? 800
    );
  }

  return <label>
    <span>{props.label}</span>
    <input class={style.input} type="text" name="value" value={value()} onInput={handleInput} />
    <Show when={valueStored()}>
      <span class={style.confirm}>✓</span>
    </Show>
  </label>;
}
