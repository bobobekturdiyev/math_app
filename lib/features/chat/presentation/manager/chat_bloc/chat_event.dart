part of 'chat_bloc.dart';

abstract class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

class StartChatEvent extends ChatEvent {
  final String id;
  final int? currentChatId;

  const StartChatEvent({
    required this.id,
    this.currentChatId,
  });
}

class SendMessagesEvent extends ChatEvent {
  final String time;
  final SendMessages sendMessages;
  const SendMessagesEvent({
    required this.sendMessages,
    required this.time,
  });
}

class UpdateListMessageEvent extends ChatEvent {}
