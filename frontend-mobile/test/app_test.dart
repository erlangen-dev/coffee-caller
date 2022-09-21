import 'dart:async';

import 'package:coffee_caller/communication/models/coffee_call.dart' as model;
import 'package:coffee_caller/communication/models/coffee_caller_command.dart';
import 'package:coffee_caller/communication/socket_client.dart';
import 'package:coffee_caller/main.dart';
import 'package:coffee_caller/storage/settings_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FakeSocketClient extends Fake implements SocketClient {
  StreamController<model.CoffeeCall> messageController = StreamController();
  StreamController<SocketConnectStatus> statusController = StreamController();

  @override
  Stream<model.CoffeeCall> get coffeeCallsStream => messageController.stream;

  @override
  Stream<SocketConnectStatus> connect() => statusController.stream;
}

void main() {
  final socket = FakeSocketClient();

  setUpAll(() async {
    Map<String, Object> values = <String, Object>{usernameKey: 'Johnny tester'};
    SharedPreferences.setMockInitialValues(values);
  });

  testWidgets('Receiving a message prints the message',
      (WidgetTester tester) async {
    await tester.pumpWidget(App(socketClient: socket));
    await tester.pump();

    socket.messageController.add(
      model.CoffeeCall(
        model.CoffeeCallStatus.announced,
        ['Hello World'],
        [
          TimedCoffeeCallerCommand(
            CoffeeCallerCommandType.join,
            'Hello World',
            DateTime(2022),
          )
        ],
      ),
    );
    await tester.pump();

    expect(
      find.textContaining('Hello World joins a coffee call'),
      findsOneWidget,
    );
  });

  testWidgets('Should display hint if no username set', (tester) async {
    SharedPreferences.setMockInitialValues({});
    await tester.pumpWidget(App(socketClient: socket));
    await tester.pump();

    expect(
      find.textContaining('Please set a username to participate in calls!'),
      findsOneWidget,
    );
  });
}
