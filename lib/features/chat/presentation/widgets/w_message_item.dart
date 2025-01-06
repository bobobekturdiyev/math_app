import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/styles.dart';
import '../../domain/entity/user_all/chat_user.dart';

class WMessageItem extends StatelessWidget {
  final bool isMe;
  final bool showAvatar;

  const WMessageItem({
    Key? key,
    required this.isMe,
    required this.showAvatar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isMe&&showAvatar) ...{
            const CircleAvatar(
              radius: 22,
              backgroundImage: CachedNetworkImageProvider(
                'https://westernfinance.org/wp-content/uploads/speaker-3-v2.jpg',
              ),
            ),
            const SizedBox(
              width: 12,
            ),
          }else...{
            const SizedBox(width: 42,)
          },
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!isMe&&showAvatar) ...{
                const SizedBox(
                  height: 6,
                ),
                Text(
                  "Jhon Abraham",
                  style: Styles.getChatItemTitle().copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
              },
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      constraints: BoxConstraints(
                        minWidth: 100,
                        maxWidth: MediaQuery.sizeOf(context).width * 0.6,
                      ),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: isMe
                            ? AppColors.primaryColor
                            : AppColors.notMeMessageColor,
                        borderRadius: BorderRadius.only(
                            bottomLeft: const Radius.circular(22),
                            bottomRight: const Radius.circular(22),
                            topRight:
                                isMe ? Radius.zero : const Radius.circular(22),
                            topLeft:
                                isMe ? const Radius.circular(22) : Radius.zero),
                      ),
                      child: Text(
                        "Salom! Jhon abraham",
                        style: Styles.getTextStyle(
                            color: isMe ? AppColors.white : AppColors.black),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: isMe ? 16 : 8, top: 8),
                      child: Text(
                        "09:25",
                        style: Styles.getChatItemSubtitleStyle().copyWith(
                            fontWeight: FontWeight.w900, fontSize: 10),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
