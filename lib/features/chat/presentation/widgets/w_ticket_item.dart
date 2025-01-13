import 'package:flutter/material.dart';
import 'package:math_app/core/di/locator.dart';
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
                    Container(
                      margin: EdgeInsets.only(left: 16),
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.redAccent.withValues(alpha: 0.5),
                      ),
                      child: Text(
                        ticketDto.status ?? "?status",
                        style: TextStyle(color: AppColors.danger, fontSize: 10),
                      ),
                    ),
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
                  if (ticketDto.message?.userId != null &&
                      ticketDto.userId != null &&
                      ticketDto.message!.userId == ticketDto.userId!) {
                    message = "Siz: $message";
                  }

                  return Text(
                    message ?? "?body",
                    style: locator<ThemeData>().textTheme.bodyMedium?.copyWith(
                          color: AppColors.grey.withValues(alpha: 0.95),
                        ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
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
