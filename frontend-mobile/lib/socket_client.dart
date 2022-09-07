import 'package:socket_io_client/socket_io_client.dart' as socket_io;

class SocketClient {
  final socket_io.Socket socket = socket_io.io('ws://localhost:4200/', <String, dynamic>{
    'autoConnect': false,
    'transports': ['websocket']
  });

  List<Function> coffeeCallSubscriptions = [];

  void init() {
    socket.connect();
    socket.onConnect((_) {
      print('Connection established');
    });
    socket.onDisconnect((_) => print('Connection Disconnection'));
    socket.onConnectError((err) => print(err));
    socket.onError((err) => print(err));

    socket.on('coffee', (data) {
      for (var sub in coffeeCallSubscriptions) {
        sub(data);
      }
    });
  }

  void sendMessage() {
    if (!socket.connected) return;

    socket.emit('coffee', 'Lets go!');
  }

  void subscribeForCoffeeCalls(Function(String) callback) {
    coffeeCallSubscriptions.add(callback);
  }
}
