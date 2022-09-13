import { Component, For } from 'solid-js';

import styles from './App.module.css';
import { SocketClient } from './socket-client';
import { Protocol } from './protocol';

const CoffeeCall: Component = () => {
  const client = new SocketClient();
  const protocol = new Protocol(client);

  return (
    <>
      <div class={styles.buttonRow}>
        <button onClick={() => protocol.join('Spiderpig')}>Join</button>
        <button onClick={() => protocol.leave('Spiderpig')}>Leave</button>
        <button onClick={() => protocol.start('Spiderpig')}>Start</button>
      </div>
      <ul>
        <For each={protocol.messages()}>{(message) =>
          <li>{message.name} {message.type}s a coffee call</li>
        }</For>
      </ul>
    </>
  );
};

export default CoffeeCall;
