class ChatUserEntities {
  final String senderType;
  final String text;
  final String time;
  final int id;
  int isRead;
  final int chatId;
  ChatUserEntities({
    required this.senderType,
    required this.text,
    required this.time,
    required this.id,
    required this.isRead,
    required this.chatId,
  });
}