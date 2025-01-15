import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:math_app/core/di/locator.dart';
import 'package:math_app/core/extensions/string_extention.dart';
import 'package:math_app/core/resources/app_colors.dart';
import 'package:math_app/features/chat/data/models/ticket/ticket_dto.dart';

class WTicketItem extends StatelessWidget {
  final TicketDto ticketDto;

  const WTicketItem({
    super.key,
    required this.ticketDto,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        ticketDto.title ?? "?title",
                        style: locator<ThemeData>().textTheme.headlineSmall,
                      ),
                    ),
                    Builder(builder: (context) {
                      String status = '';
                      Color color = AppColors.primaryColor;
                      if (ticketDto.status != null) {
                        switch (ticketDto.status) {
                          case 'open':
                            status = 'Javob kutilmoqda';
                            color = AppColors.pinkAccent;
                            break;
                          case 'closed':
                            status = 'Javob berilgan';
                            color = AppColors.primaryColor;
                            break;
                          case 'archived':
                            status = 'Arxivlangan';
                            color = AppColors.darkGrey;
                            break;
                        }
                      }

                      return Container(
                        margin: EdgeInsets.only(left: 16),
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: color,
                        ),
                        child: Text(
                          status,
                          style:
                              TextStyle(color: AppColors.white, fontSize: 10),
                        ),
                      );
                    }),
                  ],
                ),
                Text(
                  ticketDto.message?.createdAt ?? "?createdAt",
                  style: TextStyle(
                    color: AppColors.grey.withValues(alpha: 0.95),
                    fontSize: 12,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8),
                Builder(builder: (context) {
                  String? message = ticketDto.message?.body;

                  return HtmlWidget(
                    message?.readMore() ?? "?body",
                    textStyle:
                        locator<ThemeData>().textTheme.bodyMedium?.copyWith(
                              color: AppColors.grey.withValues(alpha: 0.95),
                            ),

                    customWidgetBuilder: (el) {
                      return Text(
                        el.text.readMore(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style:
                            locator<ThemeData>().textTheme.bodyMedium?.copyWith(
                                  color: AppColors.grey.withValues(alpha: 0.95),
                                ),
                      );
                    },
                    // child: Text(
                    //   message ?? "?body",
                    //   style: locator<ThemeData>().textTheme.bodyMedium?.copyWith(
                    //         color: AppColors.grey.withValues(alpha: 0.95),
                    //       ),
                    //   maxLines: 1,
                    //   overflow: TextOverflow.ellipsis,
                    // ),
                  );
                }),
                Divider(
                  color: AppColors.grey.withValues(alpha: 0.2),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
