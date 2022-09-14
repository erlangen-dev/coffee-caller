// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:async';

import 'package:coffee_caller/communication/socket_client.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:coffee_caller/main.dart';

class FakeSocketClient extends Fake implements SocketClient {
  StreamController<String> messageController = StreamController();
  StreamController<SocketClientConnectStatus> statusController =
      StreamController();

  @override
  Stream<SocketClientConnectStatus> get connectStatusStream =>
      statusController.stream;

  @override
  Stream<String> get coffeeMessageStream => messageController.stream;

  @override
  void init() {}
}

void main() {
  testWidgets('Receiving a message prints the message',
      (WidgetTester tester) async {
    final socket = FakeSocketClient();
    await tester.pumpWidget(App(socketClient: socket));

    expect(find.textContaining('Hello World'), findsNothing);

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
}
