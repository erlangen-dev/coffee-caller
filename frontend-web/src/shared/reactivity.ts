import { Accessor, createMemo, from } from "solid-js";

export function fromWithDefault<T>(source: Parameters<typeof from<T>>[0], initial: T): Accessor<T> {
    const signal = from(source);
    return createMemo(() => signal() ?? initial);
}
