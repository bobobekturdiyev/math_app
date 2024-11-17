import 'package:auto_route/auto_route.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_app/config/routes/router.gr.dart';
import 'package:math_app/core/resources/app_images.dart';
import 'package:math_app/core/resources/styles.dart';
import 'package:math_app/features/chat/presentation/widgets/w_chat_list_item.dart';

import '../../domain/entity/push_token.dart';
import '../manager/chat_manager_bloc/chat_managers_bloc.dart';

@RoutePage()
class ChatListScreen extends StatefulWidget {
  const ChatListScreen({Key? key}) : super(key: key);

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  @override
  void initState() {
    // tokenUser();
    super.initState();
  }

  void tokenUser() async {
    String? token = await FirebaseMessaging.instance.getToken();
    if (token != null) {
      context.read<ChatManagersBloc>().add(
            PushTokenEvent(
              token: PushtokenEntities(token: token),
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppImages.chatMask,
          ),
          Positioned(
            top: 24,
            left: 24,
            child: Text(
              "Chat",
              style: Styles.getTextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            margin: const EdgeInsets.only(top: 90),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(40),
                topLeft: Radius.circular(40),
              ),
            ),
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (ctx, index) =>  WChatListItem(onTap: () {
                context.router.push(const ChatRoute());
              },),
            ),
          ),
        ],
      ),
    );
  }
}

// Column(
// children: [
// const SizedBox(height: 12,),
// BlocListener<ChatManagersBloc, ChatManagersState>(
// listener: (context, state) {
// if (state is ErrorState) {
// // Navigator.of(context).pushAndRemoveUntil(
// //     MaterialPageRoute(builder: (_) => const MyApp()),
// //         (route) => false);
// }
// },
// child: BlocBuilder<ChatManagersBloc, ChatManagersState>(
// builder: (context, state) {
// if (state is GetChatManagersState) {
// return ListView.builder(
// padding: const EdgeInsets.symmetric(horizontal: 20),
// itemCount: state.users.length,
// shrinkWrap: true,
// itemBuilder: ((context, index) {
// return GestureDetector(
// behavior: HitTestBehavior.opaque,
// onTap: () async {
// context.read<ChatBloc>().add(
// StartChatEvent(
// id: state.users[index].userId
//     .toString(),
// currentChatId:
// state.users[index].chatId,
// ),
// );
// context.router.push(ChatRoute(users: state.users[index], hasAccess: true));
// },
// child: WChatItem(
// users: state.users[index],
// ),
// );
// }));
// } else if (state is ChatManagersLoadingState) {
//
// return const Center(
// child: CupertinoActivityIndicator(),
// );
// }
// return const Center(
// child: Text("data"),
// );
// },
// ),
// ),
//
// ],
// ),
