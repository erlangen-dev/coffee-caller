import { DelayedStoringInput, getUsername, storeUsername } from '@features/settings';
import { Component } from 'solid-js';


export const SettingsPage: Component = () => (
  <DelayedStoringInput
    label="Name"
    storeValue={storeUsername}
    getValue={getUsername}
  />
);