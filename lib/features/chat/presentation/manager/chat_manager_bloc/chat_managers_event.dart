part of 'chat_managers_bloc.dart';

abstract class ChatManagersEvent extends Equatable {
  const ChatManagersEvent();

  @override
  List<Object> get props => [];
}

class GetChatManagersEvent extends ChatManagersEvent {
  @override
  List<Object> get props => [];
}

class UpdateListEvent extends ChatManagersEvent {
  @override
  List<Object> get props => [];
}

class PushTokenEvent extends ChatManagersEvent {
 final PushtokenEntities token;
 const PushTokenEvent({
    required this.token,
  });

  @override
  List<Object> get props => [];
}

class UpdateNewMessage extends ChatManagersEvent {
 final int? currentChatId;
const  UpdateNewMessage({
    this.currentChatId,
  });

  @override
  List<Object> get props => [];
}

