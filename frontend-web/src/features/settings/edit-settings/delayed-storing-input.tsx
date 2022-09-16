import { Component, createSignal, Show } from "solid-js";

import style from './delayed-storing-input.module.css';

type DelayedStoringInputProps = {
  label: string,
  storeValue: (value: string) => void,
  getValue: () => string, storeDelayInMs?: number
};

export const DelayedStoringInput: Component<DelayedStoringInputProps> = (props) => {
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
