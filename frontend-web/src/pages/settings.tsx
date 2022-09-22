import { Component } from "solid-js";

import { DelayedStoringInput, getUsername, storeUsername } from "@features/settings";

export const SettingsPage: Component = () => (
  <DelayedStoringInput label="Name" storeValue={storeUsername} getValue={getUsername} />
);
