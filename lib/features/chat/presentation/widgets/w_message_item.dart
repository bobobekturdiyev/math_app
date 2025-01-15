import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:math_app/core/extensions/string_extention.dart';
import 'package:math_app/features/chat/data/models/ticket/ticket_message.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/styles.dart';

class WMessageItem extends StatelessWidget {
  final bool isMe;
  final bool previous;
  final TicketMessageDto message;
  final bool next;

  const WMessageItem({
    Key? key,
    required this.isMe,
    required this.message,
    required this.previous,
    required this.next,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: previous && isMe ? 4 : 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment:
                isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              Container(
                constraints: BoxConstraints(
                  minWidth: 100,
                  maxWidth: MediaQuery.sizeOf(context).width * 0.6,
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                margin:
                    EdgeInsets.only(right: isMe ? 8 : 0, left: !isMe ? 8 : 0),
                decoration: BoxDecoration(
                  color: isMe ? AppColors.primaryColor : AppColors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                    bottomLeft:
                        !isMe ? Radius.circular(0) : Radius.circular(12),
                    bottomRight:
                        isMe ? Radius.circular(0) : Radius.circular(12),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (!isMe) ...{
                      Text(
                        "${message.user?.name?.toUpperCase()} ${message.user?.surname?.toUpperCase()}",
                        style: Styles.getTextStyle(
                                color: isMe ? AppColors.white : AppColors.black)
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 8),
                    },
                    HtmlWidget(
                      message.body?.readMore() ?? "?body",
                      textStyle: Styles.getTextStyle(
                          color: isMe ? AppColors.white : AppColors.black),
                      customWidgetBuilder: (el) {
                        return Text(
                          el.text,
                          style: Styles.getTextStyle(
                              color: isMe ? AppColors.white : AppColors.black),
                        );
                      },
                    ),
                    SizedBox(height: 4),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        message.createdAt ?? "?created_at",
                        style: Styles.getTextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 10,
                            color: isMe
                                ? AppColors.white
                                : const Color(0xFF8A8A93)),
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
