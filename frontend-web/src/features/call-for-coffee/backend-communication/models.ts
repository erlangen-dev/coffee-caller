const commandTypes = ["join", "leave", "start"] as const;
export type CommandTypes = typeof commandTypes[number];

export interface Command {
  type: CommandTypes;
  name: string;
}

export interface TimedCommand extends Command {
  broadcastAt: Date;
}

const coffeeCallStatuses = ["inactive", "announced", "inProgress", "cancelled"] as const;
export type CoffeeCallStatus = typeof coffeeCallStatuses[number];

export interface CoffeeCall {
  status: CoffeeCallStatus;
  participants: string[];
  messages: TimedCommand[];
}
