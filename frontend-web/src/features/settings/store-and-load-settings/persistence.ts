const keys = {
  username: "username",
} as const;

type ActualKeys = typeof keys[keyof typeof keys];

export const [storeUsername, getUsername] = storeLoadFunctions<string>(keys.username, "");

function storeLoadFunctions<T>(key: ActualKeys, fallback: T): [(value: T) => void, () => T] {
  return [(value: T) => store<T>(key, value), () => load<T>(key) ?? fallback];
}

function store<T>(key: ActualKeys, value: T) {
  localStorage.setItem(key, JSON.stringify(value));
}

function load<T>(key: ActualKeys): T | null {
  const loadedValue = localStorage.getItem(key);
  return loadedValue == null ? null : JSON.parse(loadedValue);
}
