import { Accessor, Component, For, Show, splitProps } from "solid-js";
import type { CoffeeCall } from "../backend-communication/models";

export const CoffeeCallState: Component<{ coffeeCall: CoffeeCall }> = (props) => {
  const participantsAsList = () => props.coffeeCall.participants.join(',');

  //TODO: always doing props.coffeeCall is super ugly, but destructuring the props naively doesn't work. can we somehow else do this?
  // We could pass in a Accessor<CoffeeCall> but this is discouraged: https://github.com/solidjs/solid/discussions/749#discussioncomment-1740120

  return <>
    <Show when={props.coffeeCall.status === 'announced'}>Coffee call announced!</Show>
    <Show when={props.coffeeCall.status === 'inProgress'}>Coffee call in progress!</Show>
    <Show when={props.coffeeCall.status === 'cancelled'}>Coffee call canceled!</Show>

    <Show when={props.coffeeCall.status !== 'inactive' && props.coffeeCall.status !== 'cancelled'}>
      <br />
      On board: {participantsAsList()}
    </Show>

    <ul>
      <For each={props.coffeeCall.messages}>{(message) =>
        <li>{message.name} {message.type}s a coffee call @{message.broadcastAt.toLocaleString()}</li>
      }</For>
    </ul >
  </>
};