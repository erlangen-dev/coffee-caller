class Environment {
  static String get backendUrl => const String.fromEnvironment(
        'HOST',
        defaultValue: 'ws://localhost:4200/',
      );
}
