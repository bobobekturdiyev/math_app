

import '../../../../core/resources/default_response.dart';
import '../../domain/entity/user_all/chat_user.dart';
import '../../domain/entity/user_all/user_entities.dart';
import '../models/user/chat/chat_user.dart';
import '../models/user/get_chat_manager/users_dto.dart';
import 'abstract_mapper.dart';

/// Mapper folder date va domainni malumotlarini aylantirish uchun kerka
/// ikkalasi orasida malumotlarni bir shaklan boshqa shaklga oladi

class ChatMapper extends Mapper {
  List<UsersAllEntities> usersDtoToEntity(DefaultResponse<UsersDto> dto) {
    List<UsersAllEntities> users = [];
    // List<ChatUserEntities> chatUser = [];

    for (var i = 0; i < dto.data.length; i++) {
      // for (var j = 0; j < dto.data[i].chatUserDto.length; j++) {
      //   chatUser.add(ChatUserEntities(
      //     isRead: dto.data[i].chatUserDto[j].isRead,
      //     senderType: dto.data[i].chatUserDto[j].senderType,
      //     text: dto.data[i].chatUserDto[j].text,
      //     time: dto.data[i].chatUserDto[j].time,
      //     id: dto.data[i].chatUserDto[j].id,
      //     chatId: dto.data[i].chatUserDto[j].chatId,
      //   ));
      // }
      users.add(
        UsersAllEntities(
          chatId: dto.data[i].chatId,
          name: dto.data[i].user.name,
          surname: dto.data[i].user.surname,
          userId: dto.data[i].user.userId,
          hasAccess: dto.data[i].hasAccess,
          role: dto.data[i].role,
          image: dto.data[i].image,
          unread: dto.data[i].unread,
          // chatUserEntities: chatUser,
        ),
      );
    }
    return users;
  }
  List<ChatUserEntities> chatUsersToEntitiy(DefaultResponse<ChatUserDto> dto) {
    List<ChatUserEntities> chatUser = [];
    for (var i = 0; i < dto.data.length; i++) {
      chatUser.add(ChatUserEntities(
        isRead: dto.data[i].isRead,
        senderType: dto.data[i].senderType,
        text: dto.data[i].text,
        time: dto.data[i].time,
        id: dto.data[i].id, chatId: dto.data[i].chatId,
      ));
    }
    return chatUser;
  }
}
