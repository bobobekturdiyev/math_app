// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'chat_bloc.dart';

abstract class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object> get props => [];
}

class ChatInitial extends ChatState {}


class ChatLoadingState extends ChatState{}
class StartchatState extends ChatState {
  final StateStatus stateStatus;
  final List<ChatUserEntities> chatUser;
  const StartchatState({
    this.stateStatus = StateStatus.normal,
    required this.chatUser,
  });
  @override
  List<Object> get props => [chatUser, stateStatus];
}


class ErrorChatState extends ChatState {}
