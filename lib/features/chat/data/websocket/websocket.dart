import 'dart:convert';

import 'package:math_app/features/chat/data/websocket/websocket_config.dart';
import 'package:web_socket_channel/io.dart';

class CustomWebsocket {
  late IOWebSocketChannel channel;

  CustomWebsocket.connect() {
    final url = WebSocketConfig.getUrl();
    channel = IOWebSocketChannel.connect(url);
  }

  join(String channel) {
    Map<String, dynamic> data = {
      'event': 'pusher:subscribe',
      'data': {
        'channel': channel,
      }
    };

    this.channel.sink.add(jsonEncode(data));
  }

  Stream<dynamic> getStream() {

    return channel.stream;
  }

  void close() {
    channel.sink.close();
  }

  static Map<String, dynamic> getJson(String event) {
    return jsonDecode(jsonDecode(event)['data']);
  }

  static  String getEvent(String event) {
    return jsonDecode(event)['event'];
  }

  static String getChannel(String event) {
    return jsonDecode(event)['channel'];
  }
}
