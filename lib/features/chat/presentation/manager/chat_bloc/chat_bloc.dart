import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_app/core/di/locator.dart';
import 'package:math_app/features/chat/presentation/manager/chat_manager_bloc/chat_managers_bloc.dart';

import '../../../../../core/error/auth_error.dart';
import '../../../../../core/resources/state_status.dart';
import '../../../data/websocket/socket_instance.dart';
import '../../../data/websocket/websocket.dart';
import '../../../domain/entity/messages/push_messages.dart';
import '../../../domain/entity/messages/read_messages_response_entities.dart';
import '../../../domain/entity/messages/socket_messages/message.dart';
import '../../../domain/entity/messages/socket_messages/read_messages.dart';
import '../../../domain/entity/user_all/chat_user.dart';
import '../../../domain/usecases/chat_use.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  String id = '';
  int? currentChatId;
  late List<ChatUserEntities> chatUsers;
  ChatUseCases chatUseCases;
  SocketInstanse socketInstanse = SocketInstanse();



  ChatBloc(this.chatUseCases) : super(ChatInitial()) {
    on<StartChatEvent>((event, emit) async {
      currentChatId = event.currentChatId;

      emit(ChatLoadingState());
      try {
        chatUsers = await chatUseCases.chatUsers(event.id);
        id = event.id;
        if (chatUsers.isNotEmpty && chatUsers[0].senderType == 'user') {
          chatUseCases.readMessages(ReadMessages(
            messages: [chatUsers[0].id],
          ));
        }
        emit(StartchatState(chatUser: chatUsers));
        connect();
      } catch (e) {
        if (e is AuthException) {}
      }
    });
    on<SendMessagesEvent>((event, emit) async{
      emit(
        StartchatState(
          chatUser: chatUsers,
          stateStatus: StateStatus.loading,
        ),
      );
      chatUsers.insert(
          0,
          ChatUserEntities(
            senderType: 'student',
            text: event.sendMessages.text,
            time: event.time,
            isRead: 0,
            id:chatUsers.isNotEmpty? chatUsers[0].id + 1:0,
            chatId: currentChatId??0,
          ));

      emit(StartchatState(
          chatUser: chatUsers,
          stateStatus: StateStatus.loaded,
        ),);
   await   chatUseCases.sendMessages(
        SendMessages(
          text: event.sendMessages.text,
          userId: event.sendMessages.userId,
          token: event.sendMessages.token,
        ),
      );


      if(currentChatId == null&& chatUsers[0].chatId != null&&chatUsers.length>2){

     socketInstanse.joinChannelChat('chat_${chatUsers[0].chatId}');
   }
   if(chatUsers.length<2){

     chatUsers = await chatUseCases.chatUsers(id);
     socketInstanse.joinChannelChat('chat_${chatUsers[0].chatId}');
   }


    });
    on<UpdateListMessageEvent>((event, emit) {
      emit(StartchatState(
          chatUser: chatUsers, stateStatus: StateStatus.loading));
      emit(
        StartchatState(chatUser: chatUsers, stateStatus: StateStatus.loaded),
      );
    });
  }

  void connect() {
    if (currentChatId != null) {

      socketInstanse.joinChannelChat('chat_$currentChatId');
    }
    socketInstanse.socket.getStream().listen((event) {
      doEvent(event);


    });
  }

  doEvent(String event) {
    final eventName = CustomWebsocket.getEvent(event);
    switch (eventName) {
      case "App\\Events\\MessageSent":
        {
          MessageType message = MessageType.fromJson(
            CustomWebsocket.getJson(event)['message'],
          );
          if (message.senderType == 'student') {

            chatUsers[0] = ChatUserEntities(
              senderType: message.senderType,
              text: message.text,
              time: message.time,
              id: message.id,
              isRead: 0,
              chatId: message.chatId,
            );
          } else {
            chatUsers.insert(
              0,
              ChatUserEntities(
                senderType: message.senderType,
                text: message.text,
                time: message.time,
                id: message.id,
                isRead: 0,
                chatId: message.chatId,
              ),
            );
            if (message.chatId == currentChatId) {
              chatUseCases.readMessages(
                ReadMessages(
                  messages: [message.id],
                ),
              );
            }
          }
          add(UpdateListMessageEvent());
          return '';
        }
      case 'App\\Events\\ReadMessage':
        {
          ReadMessageType a = ReadMessageType.fromJson(
            CustomWebsocket.getJson(event),
          );

          for (int i = 0; i < a.messageIds.length; i++) {
            for (int j = 0; j < chatUsers.length; j++) {
              if (a.messageIds[i] == chatUsers[j].id) {
                chatUsers[j].isRead = 1;
                break;
              }
            }
            add(UpdateListMessageEvent());
          }

          return '';
        }
    }
  }
}
