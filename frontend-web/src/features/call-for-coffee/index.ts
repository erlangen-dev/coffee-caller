import type { CoffeeCall } from './backend-communication/models';

export { SocketClient } from './backend-communication/socket-client';
export { Protocol } from './backend-communication/protocol';
export { CoffeeCallState } from './coffee-call-state/coffee-call-state';
export { ButtonRow } from './button-row/button-row';

export type { CoffeeCall } from './backend-communication/models'

export const emptyCoffeeCall: Readonly<CoffeeCall> = { participants: [], status: 'inactive', messages: [] };