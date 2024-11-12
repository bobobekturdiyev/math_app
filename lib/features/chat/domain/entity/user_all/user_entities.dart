// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'chat_user.dart';

class UsersAllEntities {
  final String? image;
  final String name;
  final String surname;
  final int userId;
  final bool hasAccess;
  final String role;
  final int? chatId;
  String lastMessage;
  String? lastDate;
  // final List<ChatUserEntities> chatUserEntities;
  int messageCount;
  bool unread;
  UsersAllEntities( {
    required this.name,
    required this.surname,
    required this.userId,
    required this.hasAccess,
    required this.role,
    required this.image,
    this.chatId,
    this.messageCount = 0,
    this.lastDate,
    this.lastMessage='',

    required this.unread,
    // required this.chatUserEntities
  });

  @override
  String toString() {
    return this.name + "  " + this.messageCount.toString();
  }
}
