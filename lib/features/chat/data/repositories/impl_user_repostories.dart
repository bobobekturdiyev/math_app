import 'package:dio/dio.dart';

import '../../../../core/error/auth_error.dart';
import '../../domain/entity/messages/push_messages.dart';
import '../../domain/entity/messages/read_messages_response_entities.dart';
import '../../domain/entity/push_token.dart';
import '../../domain/entity/user_all/chat_user.dart';
import '../../domain/entity/user_all/user_entities.dart';
import '../../domain/repositories/chat_repo.dart';
import '../data_source/chat_service/chat_service.dart';
import '../mapper/chat_mapper.dart';

class ImplChatRepo extends ChatRepo {
  final ChatService authService;
  final ChatMapper authMapper;

  ImplChatRepo({
    required this.authService,
    required this.authMapper,
  });

  @override
  Future<List<UsersAllEntities>> getAllUsers() {
    return authService.getUsers().then((value) {
      return authMapper.usersDtoToEntity(value.data);
    }).catchError((e) {
      _checkError(e);
    });
  }

  @override
  Future<List<ChatUserEntities>> chatUsers(String id) {
    return authService.getChat(id: id).then((value) {
      return authMapper.chatUsersToEntitiy(value.data);
    }).catchError((e) {
      _checkError(e);
    });
  }

  @override
  Future pushSend(SendMessages sendMessages) {
    return authService.sendMessages(sendMessages).then((value) {
      return value.data;
    });
  }

  @override
  Future pushToken(PushtokenEntities token) {
    return authService.pushToken(token).then((value) => value.data);
  }

  @override
  Future readMessages(ReadMessages message) {
    return authService.readMessages(message).then((value) => value.data);
  }

  _checkError(e) {
    if (e is DioError && e.response?.statusCode == 401) {
      throw const AuthException();
    }
  }
}
