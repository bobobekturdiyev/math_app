import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:math_app/core/resources/app_icons.dart';
import 'package:math_app/features/chat/presentation/manager/chat_manager_bloc/chat_managers_bloc.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/styles.dart';
import '../../domain/entity/user_all/user_entities.dart';

class WChatItem extends StatelessWidget {
  final UsersAllEntities users;

  const WChatItem({Key? key, required this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                spreadRadius: 0,
                blurRadius: 15,
                offset: const Offset(0, 10),
                color: Colors.black.withOpacity(0.05)),
          ]),
      child: Row(
        mainAxisSize: MainAxisSize.max,

        // mainAxisAlignment: MainAxisAlignment.spaceBetween,

        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          users.image == null
              ? CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.grey.withOpacity(0.2),
                )
              : const CircleAvatar(
                  radius: 24,
                  // backgroundImage: NetworkImage(
                  //   users.image,
                  // ),
                ),
          const SizedBox(
            width: 12,
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width*0.4,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${users.role} ",
                  style: Styles.getTextStyle(fontWeight: FontWeight.w500),
                  textWidthBasis: TextWidthBasis.longestLine,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (users.unread) ...{
                      SvgPicture.asset(AppIcons.doubleCheck),
                      const SizedBox(
                        width: 6,
                      )
                    },
                    Expanded(
                      child: Text(
                        users.lastMessage ?? '',
                        style: Styles.getTextStyle(
                            fontSize: 12, color: const Color(0xFF8A8A93)),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          const Spacer(),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                users.lastDate ?? '',
                style: Styles.getTextStyle(
                    fontSize: 12, color: const Color(0xFF8A8A93)),
              ),
              if (users.messageCount > 0) ...{
                Container(
                  alignment: Alignment.center,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: AppColors.primaryColor),
                  child: Text(
                    users.messageCount.toString(),
                    style: Styles.getTextStyle(
                        fontSize: 12, color: AppColors.white),
                  ),
                ),
              },
              if (users.lastMessage.isEmpty) ...{
                Align(
                  alignment: Alignment.centerRight,
                  child: SvgPicture.asset(AppIcons.arrowRight),
                )
              }
            ],
          )
        ],
      ),
    );
  }
}
