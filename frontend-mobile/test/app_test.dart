import 'dart:async';

import 'package:coffee_caller/communication/models/coffee_caller_message.dart';
import 'package:coffee_caller/communication/socket_client.dart';
import 'package:coffee_caller/main.dart';
import 'package:coffee_caller/storage/settings_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FakeSocketClient extends Fake implements SocketClient {
  StreamController<ReceivedCoffeeCallerMessage> messageController =
      StreamController();
  StreamController<SocketConnectStatus> statusController = StreamController();

  @override
  Stream<ReceivedCoffeeCallerMessage> get coffeeMessage =>
      messageController.stream;

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

    socket.messageController.add(ReceivedCoffeeCallerMessage(
        CoffeeCallerMessageType.join, 'John', DateTime.now()));
    await tester.pump();

    expect(
      find.textContaining('John joins a coffee call'),
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
