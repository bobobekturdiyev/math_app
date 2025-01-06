import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:math_app/core/resources/app_colors.dart';
import 'package:math_app/core/widgets/unfocus.dart';
import 'package:math_app/features/chat/presentation/widgets/w_chat_field.dart';
import 'package:math_app/features/chat/presentation/widgets/w_chat_user_avatar.dart';
import 'package:math_app/features/chat/presentation/widgets/w_message_item.dart';
import '../../../../core/resources/app_icons.dart';
import '../../../../core/resources/styles.dart';
import '../../domain/entity/user_all/chat_user.dart';
import '../manager/chat_bloc/chat_bloc.dart';
import '../manager/chat_manager_bloc/chat_managers_bloc.dart';

@RoutePage()
class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});



  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Unfocus(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: AppColors.backgroundColor,
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

                    context.router.maybePop();
                  },
                  child: SvgPicture.asset(AppIcons.backIcon),
                ),
                const SizedBox(
                  width: 12,
                ),
                const WChatUserAvatar(
                  radius: 22,
                ),
                const SizedBox(
                  width: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Jhon Abraham",
                      style: Styles.getChatItemTitle(),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      "Online",
                      style: Styles.getChatItemSubtitleStyle(),
                    ),
                  ],
                ),
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

          },
          child: Column(
            children: [
              Expanded(
                child: BlocBuilder<ChatBloc, ChatState>(
                  builder: (context, state) {
                    if (state is StartchatState) {
                      if (state.chatUser.isEmpty) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(AppIcons.noChat),
                              const SizedBox(
                                height: 12,
                              ),
                              Text(
                                "Siz hali suhbat qurmagansiz",
                                style: Styles.getTextStyle(
                                    fontSize: 16, color: const Color(0xFF8A8A93)),
                              )
                            ],
                          ),
                        );
                      } else {
                        return ListView.builder(
                          reverse: true,
                          itemCount: 4,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          itemBuilder: (context, index) {
                            ChatUserEntities chat = state.chatUser[index];
                            bool isMe;
                            bool previous = false;
                            bool next = false;
                            if (index > 0) {
                              next = state.chatUser[index - 1].senderType ==
                                  state.chatUser[index].senderType;
                            }
                            if (index + 1 < state.chatUser.length) {
                              previous = state.chatUser[index].senderType ==
                                  state.chatUser[index + 1].senderType;
                            }

                            if (state.chatUser[index].senderType == 'student') {
                              isMe = true;
                            } else {
                              isMe = false;
                            }

                            // return WMessageItem(
                            //   isMe: isMe,
                            //   chat: chat,
                            //   previous:previous,
                            //   next: next,
                            //
                            // );
                          },
                        );
                      }
                    } else if (state is ChatLoadingState) {
                      return const Center(
                        child: CupertinoActivityIndicator(),
                      );
                    }
                    return ListView.builder(
                      reverse: true,
                      itemCount: 5,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemBuilder: (context, index) {
                        return WMessageItem(
                          isMe: index == 4 || index == 2,
                          showAvatar: index == 1 || index == 3,
                        );
                      },
                    );
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(24, 20, 24, 30),

                decoration: const BoxDecoration(
                  border: Border(top: BorderSide(color: Color(0xFFEEFAF8)),),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: WChatField(
                        margin: EdgeInsets.zero,
                        hint: "Type here...",
                        controller: controller,
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(32),
                      onTap: () {

                      },
                      child: SvgPicture.asset(AppIcons.send),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),

      ),
    );
  }
}
