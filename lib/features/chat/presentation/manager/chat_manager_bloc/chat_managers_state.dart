part of 'chat_managers_bloc.dart';

abstract class ChatManagersState extends Equatable {
  const ChatManagersState();

  @override
  List<Object> get props => [];
}

class ChatManagersInitial extends ChatManagersState {}

class ChatManagersLoadingState extends ChatManagersState {}

class GetChatManagersState extends ChatManagersState {
  final StateStatus stateStatus;
  final List<UsersAllEntities> users;
  GetChatManagersState({
    required this.users,
    this.stateStatus = StateStatus.normal,
  });
  @override
  List<Object> get props => [
        stateStatus,
        users,
      ];
}

class ErrorState extends ChatManagersState {}
