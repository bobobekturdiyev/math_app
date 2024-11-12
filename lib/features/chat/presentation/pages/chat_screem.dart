import 'dart:convert';

import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:math_app/core/resources/app_colors.dart';
import 'package:math_app/core/resources/app_images.dart';
import 'package:math_app/core/widgets/unfocus.dart';
import 'package:math_app/features/chat/presentation/widgets/w_chat_field.dart';
import 'package:math_app/features/chat/presentation/widgets/w_message_item.dart';

import '../../../../core/resources/app_icons.dart';
import '../../../../core/resources/styles.dart';
import '../../domain/entity/messages/push_messages.dart';
import '../../domain/entity/push_token.dart';
import '../../domain/entity/user_all/chat_user.dart';
import '../../domain/entity/user_all/user_entities.dart';
import '../manager/chat_bloc/chat_bloc.dart';
import '../manager/chat_manager_bloc/chat_managers_bloc.dart';
@RoutePage()
class ChatScreen extends StatefulWidget {
  final UsersAllEntities users;
  final bool hasAccess;


  const ChatScreen({Key? key, required this.users, required this.hasAccess,}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController controller=TextEditingController();




  @override
  Widget build(BuildContext context) {
    return Unfocus(
      child: WillPopScope(
        onWillPop: ()async {
          return true;
        },
        child: Scaffold(
          backgroundColor: AppColors.lessonTabBar,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            scrolledUnderElevation: 0,
            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {
                      context
                          .read<ChatManagersBloc>()
                          .add(const UpdateNewMessage());

                      context.router.pop();
                    },
                    child: SvgPicture.asset(AppIcons.arrowLeft),
                  ),
                  const SizedBox(width: 16,),
                  Image.asset(AppImages.logoMini,width: 28,height: 28,),
                  const SizedBox(width: 16,),
                  Text("Chat",style: Styles.getTextStyle(fontSize: 16),),

                ],
              ),
            ),
          ),


          body: BlocListener<ChatBloc, ChatState>(
            listener: (ctx, state) {
              if (state is StartchatState && state.chatUser.isNotEmpty) {
                context.read<ChatManagersBloc>().add(
                      UpdateNewMessage(
                        currentChatId:
                            state.chatUser[state.chatUser.length - 1].chatId,
                      ),
                    );
              }
              if (state is ErrorChatState) {
                // Navigator.of(context).pushAndRemoveUntil(
                //     MaterialPageRoute(builder: (_) => const MyApp()),
                //     (route) => false);
              }
            },
            child: BlocBuilder<ChatBloc, ChatState>(
              builder: (context, state) {
                if (state is StartchatState) {
                  if(state.chatUser.isEmpty){
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          SvgPicture.asset(AppIcons.noChat),
                          const SizedBox(height: 12,),
                          Text(
                            "Siz hali suhbat qurmagansiz",
                            style: Styles.getTextStyle(fontSize: 16, color: const Color(0xFF8A8A93)),
                          )
                        ],
                      ),
                    );
                  }
                 else {
                    return ListView.builder(
                      reverse: true,
                      itemCount: state.chatUser.length,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemBuilder: (context, index) {
                        ChatUserEntities chat = state.chatUser[index];
                        bool isMe;
                        bool previous = false;
                        bool next = false;
                        if(index>0){
                          next=state.chatUser[index-1].senderType == state.chatUser[index].senderType;
                        }
                        if(index+1<state.chatUser.length){
                          previous=state.chatUser[index].senderType == state.chatUser[index+1].senderType;
                        }

                        if (state.chatUser[index].senderType == 'student') {
                          isMe = true;

                        } else {
                          isMe = false;
                        }

                        return WMessageItem(
                          isMe: isMe,
                          chat: chat,
                          previous:previous,
                          next: next,
                          
                        );
                      },
                    );
                  }
                } else if (state is ChatLoadingState) {
                  return const Center(
                    child: CupertinoActivityIndicator(),
                  );
                }
                return const SizedBox();
              },
            ),
          ),

          bottomNavigationBar: Container(
            height: 64,
            padding: const EdgeInsets.only(right: 16),
            margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            color: AppColors.white,
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    border: Border(
                      right: BorderSide(color: AppColors.lessonTabBar)
                    )
                  ),
                  child: SvgPicture.asset(AppIcons.attach),

                ),
                Expanded(child: WChatField(
                  hint: "Type here...",
                  controller: controller,)),
                GestureDetector(
                  onTap: () {
                    print(
                        "Berilgan shart: ${controller.text.isNotEmpty} ");
                    if (controller.text.isNotEmpty) {
                      print(controller.text);
                      print('Button ishladi');
                      DateTime dataTime = DateTime.now();
                      String formattedDate =
                      DateFormat('HH:mm').format(dataTime);
                      if (controller.text.trim().isNotEmpty) {
                        context.read<ChatBloc>().add(
                          SendMessagesEvent(
                            sendMessages: SendMessages(
                              text: controller.text,
                              userId: widget.users.userId,
                              token: base64Encode(
                                utf8.encode(
                                  dataTime.toString(),
                                ),
                              ),
                            ),
                            time: formattedDate,
                          ),
                        );
                        controller.clear();
                      }
                    } else {
                      print('olleh');
                    }
                    controller.text.isNotEmpty
                        ? () {
                      print('Button ishladi');
                      DateTime dataTime = DateTime.now();
                      String formattedDate =
                      DateFormat('HH:mm').format(dataTime);
                      if (controller.text.trim().isNotEmpty) {
                        context.read<ChatBloc>().add(
                          SendMessagesEvent(
                            sendMessages: SendMessages(
                              text: controller.text,
                              userId: widget.users.userId,
                              token: base64Encode(
                                utf8.encode(
                                  dataTime.toString(),
                                ),
                              ),
                            ),
                            time: formattedDate,
                          ),
                        );
                        controller.clear();
                      }
                    }
                        : () {

                      print(controller.text);
                    };
                  },
                  child: Container(
                    padding: const EdgeInsets.only(top: 10,right: 8,left: 12,bottom: 10),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: SvgPicture.asset(AppIcons.send),
                  ),
                )

              ],
            ),
          ) ,

        ),
      ),
    );
  }

}
