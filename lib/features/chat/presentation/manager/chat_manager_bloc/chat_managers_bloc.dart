import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/error/auth_error.dart';
import '../../../../../core/resources/state_status.dart';
import '../../../data/data_source/notifation_service/notifation_service.dart';
import '../../../data/websocket/socket_instance.dart';
import '../../../data/websocket/websocket.dart';
import '../../../domain/entity/messages/socket_messages/message.dart';
import '../../../domain/entity/push_token.dart';
import '../../../domain/entity/user_all/user_entities.dart';
import '../../../domain/usecases/chat_use.dart';

part 'chat_managers_event.dart';
part 'chat_managers_state.dart';

class ChatManagersBloc extends Bloc<ChatManagersEvent, ChatManagersState> {
  SocketInstanse socketInstanse = SocketInstanse();
  ChatUseCases chatUseCases;
  List<String> channel = [];
  List<UsersAllEntities> users = [];
  int? currentChatId;

  ChatManagersBloc(this.chatUseCases) : super(ChatManagersInitial()) {
    on<PushTokenEvent>((event, emit) {
      chatUseCases.pushToken(event.token);
    });

    on<GetChatManagersEvent>((event, emit) async {
      emit(ChatManagersLoadingState());
      try {
        users = await chatUseCases.getAllUsers();

        channel = socketInstanse.joinChannel(users);
        emit(GetChatManagersState(
          users: users,
        ));
        if(channel.isNotEmpty) {
          print('Event Bor');
          connect();
        }

      } catch (e) {
        if (e is AuthException) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.clear();
          emit(ErrorState());
        }
      }
    });
    on<UpdateNewMessage>((event, emit) {
      print('<<<<<<<<<<<<<<${event.currentChatId}>>>>>>>>>>>>>>');
      currentChatId = event.currentChatId;
      emit(GetChatManagersState(
        users: users,
        stateStatus: StateStatus.loading,
      ));
      if (event.currentChatId != null) {
        for (var i = 0; i < users.length; i++) {
          if (event.currentChatId == users[i].chatId) {
            users[i].messageCount = 0;
            break;
          }
        }
      }

      emit(GetChatManagersState(
        users: users,
        stateStatus: StateStatus.loaded,
      ));
    });
    on<UpdateListEvent>((event, emit) {
      emit(
        GetChatManagersState(
          users: users,
          stateStatus: StateStatus.loading,
        ),
      );
      emit(GetChatManagersState(
        users: users,
        stateStatus: StateStatus.loaded,
      ));
    });

    add(GetChatManagersEvent());
  }
  void connect() {
    socketInstanse.socket.getStream().listen((event) {

      doEvent(event);
    });
  }

  doEvent(String event) {
    final eventName = CustomWebsocket.getEvent(event);
    switch (eventName) {
      case 'App\\Events\\MessageSent':
        {
          MessageType message =
              MessageType.fromJson(CustomWebsocket.getJson(event)['message']);
          if (!channel.contains('chat_${message.chatId}')) {
            //yangi channelga qo'shilish
            //! Bir qayta API ni tortib kelish kerak deb o'ylayman
            channel = socketInstanse.joinChannel(users);
          }
          for (int i = 0; i < users.length; i++) {
            if (message.chatId != currentChatId &&
                currentChatId != null &&
                message.chatId == users[i].chatId) {


              // NotificationService().showNotification(
              //   title: users[i].name,
              //   body: message.text,
              // );
            }
            if (users[i].chatId == message.chatId) {
              if (message.senderType == 'user' &&
                  message.chatId != currentChatId) {
                users[i].lastMessage=message.text;
                users[i].lastDate=message.time;


                users[i].messageCount++;
              }
              UsersAllEntities user = users[i];
              users.removeAt(i);
              users.insert(0, user);
              add(UpdateListEvent());
              break;
            }
          }
        }
    }
  }
}
