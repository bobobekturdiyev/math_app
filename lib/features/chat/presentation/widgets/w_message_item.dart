import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/styles.dart';
import '../../domain/entity/user_all/chat_user.dart';
class WMessageItem extends StatelessWidget {
  final bool isMe;
  final bool previous;
  final ChatUserEntities chat;
  final bool next;

  const WMessageItem({Key? key, required this.isMe, required this.chat, required this.previous, required this.next, })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.only(top: previous?4:16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Container(
          //   padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
          //   decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(49),
          //       color: AppColors.dateColor
          //   ),
          //   child: Text(),
          // ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment:isMe? MainAxisAlignment.end:MainAxisAlignment.start,
            children: [
              if(!isMe&&!next)...{
                Container(
                  width: 20,
                  height: 20,
                  decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(6)),
                  child: CachedNetworkImage(
                    imageUrl:
                    'https://westernfinance.org/wp-content/uploads/speaker-3-v2.jpg',
                    fit: BoxFit.cover,
                  ),
                ),

              }else...{
                const SizedBox(width: 20,)
              },
              Stack(
                children: [
                  Container(
                    constraints: BoxConstraints(
                      minWidth: 100,
                      maxWidth: MediaQuery.sizeOf(context).width * 0.6,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 12),
                    margin:   EdgeInsets.only(right:isMe?8:0,left: !isMe?8:0 ),
                    decoration:  BoxDecoration(
                        color: isMe? AppColors.primaryColor:AppColors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Text(
                        chat.text,
                        style: Styles.getTextStyle(color:isMe? AppColors.white:AppColors.black),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom:  4,
                    right: 12,
                    child: Text(
                      chat.time,
                      style: Styles.getTextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 10,
                          color:isMe? AppColors.white:const Color(0xFF8A8A93)),
                    ),
                  )

                ],
              ),

              if(isMe&&!next)...{

                Container(
                  width: 20,
                  height: 20,

                  decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(6)),
                  child: CachedNetworkImage(
                    imageUrl:
                    'https://westernfinance.org/wp-content/uploads/speaker-3-v2.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              }else...{
                const SizedBox(width: 20,),

              }
            ],
          ),
        ],
      ),
    );
  }
}
