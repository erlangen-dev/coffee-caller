import 'package:coffee_caller/communication/socket_client.dart';
import 'package:flutter/material.dart';

class ConnectStatusIcon extends StatelessWidget {
  final SocketConnectStatus connectStatus;

  ConnectStatusIcon({super.key, required this.connectStatus});

  @override
  Widget build(BuildContext context) {
    final color = connectStatusToColor[connectStatus];
    return Icon(Icons.circle, color: color);
  }

  final Map<SocketConnectStatus, Color> connectStatusToColor = {
    SocketConnectStatus.connected: Colors.greenAccent,
    SocketConnectStatus.connecting: Colors.yellow,
    SocketConnectStatus.disconnected: Colors.grey,
    SocketConnectStatus.error: Colors.red,
    SocketConnectStatus.unknown: Colors.grey,
  };
}
