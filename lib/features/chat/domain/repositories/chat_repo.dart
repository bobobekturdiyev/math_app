
import '../entity/messages/push_messages.dart';
import '../entity/messages/read_messages_response_entities.dart';
import '../entity/push_token.dart';
import '../entity/user_all/chat_user.dart';
import '../entity/user_all/user_entities.dart';

abstract class ChatRepo {
  Future<List<UsersAllEntities>> getAllUsers();
  Future<List<ChatUserEntities>> chatUsers(String id);
  Future pushSend(SendMessages sendMessages);
  Future pushToken(PushtokenEntities token);
  Future readMessages(ReadMessages message);
}
