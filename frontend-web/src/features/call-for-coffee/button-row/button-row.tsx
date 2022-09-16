import { Link } from '@solidjs/router';
import { Component, Show } from 'solid-js';
import styles from './button-row.module.css';

type ButtonRowProps = {
  usernameIsSet: boolean,
  joinClicked: VoidFunction,
  leaveClicked: VoidFunction,
  startClicked: VoidFunction
};
export const ButtonRow: Component<ButtonRowProps> = (props) => {
  return <div class={styles.buttonRow}>
    <Show
      when={props.usernameIsSet}
      fallback={
        <>
          To participate in calls, set your name first.<br />
          <em>→ <Link href="/settings">Settings</Link></em>
        </>
      }
    >
      <button onClick={props.joinClicked}>Join</button>
      <button onClick={props.leaveClicked}>Leave</button>
      <button onClick={props.startClicked}>Start</button>
    </Show>
  </div>;
}