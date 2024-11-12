

import 'package:math_app/features/chat/data/websocket/websocket.dart';

import '../../domain/entity/user_all/user_entities.dart';

class SocketInstanse {
  final socket = CustomWebsocket.connect();
  List<String> joinChannelUser = [];
  joinChannelChat(String chat) {
    print("join bo'layapti");
    socket.join(chat);
  }

  List<String> joinChannel(List<UsersAllEntities> users) {
    joinChannelUser.clear();
    for (var i = 0; i < users.length; i++) {
      if (users[i].chatId != null) {
        print('chat_${users[i].chatId}');
        socket.join('chat_${users[i].chatId}');
        joinChannelUser.add('chat_${users[i].chatId}');
      }
    }
    return joinChannelUser;
  }
}
