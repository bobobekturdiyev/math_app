import 'package:flutter/material.dart';
import 'package:math_app/core/resources/app_colors.dart';
import 'package:math_app/core/resources/styles.dart';
import 'package:math_app/features/chat/presentation/widgets/w_chat_user_avatar.dart';

class WChatListItem extends StatelessWidget {
  final GestureTapCallback onTap;
  const WChatListItem({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: Row(
          children: [
            const WChatUserAvatar(),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          "Alex Linderson",
                          style: Styles.getChatItemTitle(),
                        ),
                      ),
                      Text(
                        "2 minut oldin",
                        style: Styles.getChatItemSubtitleStyle(),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          "Uchrashuvda qatnashishni o'tkazib yubormang.",
                          style: Styles.getChatItemSubtitleStyle(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      CircleAvatar(
                        radius: 12,
                        backgroundColor: AppColors.chatCountBadgeColor,
                        child: Text(
                          "3",
                          style: Styles.getChatCountStyle(),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
