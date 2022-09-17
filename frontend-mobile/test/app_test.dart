import 'dart:async';

import 'package:coffee_caller/communication/socket_client.dart';
import 'package:coffee_caller/main.dart';
import 'package:coffee_caller/storage/settings_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FakeSocketClient extends Fake implements SocketClient {
  StreamController<String> messageController = StreamController();
  StreamController<SocketConnectStatus> statusController = StreamController();

  @override
  Stream<SocketConnectStatus> get connectStatusStream =>
      statusController.stream;

  @override
  Stream<String> get coffeeMessageStream => messageController.stream;

  @override
  void init() {}
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

    socket.messageController.add('''{
      "type": "join",
      "name": "Hello World",
      "broadcastAt": "2022-09-15T07:28:45.119Z"
    }''');
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
