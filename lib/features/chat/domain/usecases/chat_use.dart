
import '../entity/messages/push_messages.dart';
import '../entity/messages/read_messages_response_entities.dart';
import '../entity/push_token.dart';
import '../entity/user_all/chat_user.dart';
import '../entity/user_all/user_entities.dart';
import '../repositories/chat_repo.dart';

class ChatUseCases {
  final ChatRepo chatRepo;
  ChatUseCases({
    required this.chatRepo,
  });

  Future<List<UsersAllEntities>> getAllUsers() async {
    return await chatRepo.getAllUsers();
  }

  Future<List<ChatUserEntities>> chatUsers(String id) async {
    return await chatRepo.chatUsers(id);
  }

  Future sendMessages(SendMessages sendMessages) async {
    return chatRepo.pushSend(sendMessages);
  }

  Future pushToken(PushtokenEntities token) async {
    return chatRepo.pushToken(token);
  }

  Future readMessages(ReadMessages message) async {
    return chatRepo.readMessages(message);
  }
}
