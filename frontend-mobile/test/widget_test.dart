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

    expect(find.text('Hello World'), findsNothing);

    socket.messageController.add('Hello World');
    await tester.pump();

    expect(find.text('Hello World'), findsOneWidget);
  });
}
