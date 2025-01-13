import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:math_app/core/di/locator.dart';
import 'package:math_app/core/resources/app_colors.dart';
import 'package:math_app/core/resources/app_icons.dart';
import 'package:math_app/core/widgets/unfocus.dart';
import 'package:math_app/core/widgets/w_button.dart';
import 'package:math_app/core/widgets/w_loader.dart';
import 'package:math_app/features/chat/data/models/ticket/ticket_dto.dart';
import 'package:math_app/features/chat/presentation/manager/ticket/ticket_bloc.dart';
import 'package:math_app/features/chat/presentation/manager/ticket_message/ticket_messages_bloc.dart';
import 'package:math_app/features/chat/presentation/widgets/w_message_item.dart';

@RoutePage()
class TicketMessagesScreen extends StatefulWidget {
  final TicketDto ticketDto;

  const TicketMessagesScreen({
    super.key,
    required this.ticketDto,
  });

  @override
  State<TicketMessagesScreen> createState() => _TicketMessagesScreenState();
}

class _TicketMessagesScreenState extends State<TicketMessagesScreen> {
  TicketMessagesBloc ticketMessagesBloc = TicketMessagesBloc();
  ScrollController controller = ScrollController();
  TextEditingController messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadTicketMessages();
  }

  _loadTicketMessages() {
    if (widget.ticketDto.id != null) {
      ticketMessagesBloc
          .add(LoadTicketMessages(ticketId: widget.ticketDto.id!));
    }
  }

  @override
  void dispose() {
    messageController.dispose();
    controller.dispose();
    super.dispose();
  }

  void _scrollToEnd() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (controller.hasClients) {
        controller.animateTo(
          controller.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TicketMessagesBloc>.value(
      value: ticketMessagesBloc,
      child: BlocListener<TicketMessagesBloc, TicketMessagesState>(
        listener: (context, state) {
          if (state is TicketMessagesLoaded && !state.isLoading) {
            locator<TicketBloc>().add(LoadTickets());
          }
        },
        child: Unfocus(
          child: Scaffold(
            backgroundColor: AppColors.backgroundColor,
            body: RefreshIndicator(
              color: AppColors.primaryColor,
              backgroundColor: AppColors.white,
              onRefresh: () async {
                _loadTicketMessages();
              },
              child: CustomScrollView(
                controller: controller,
                slivers: [
                  SliverAppBar(
                    pinned: true,
                    floating: true,
                    elevation: 0,
                    backgroundColor: AppColors.white,
                    titleSpacing: 0,
                    title: Text(
                      widget.ticketDto.title ?? "?title",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                  BlocBuilder<TicketMessagesBloc, TicketMessagesState>(
                    builder: (context, state) {
                      if (state is TicketMessagesLoaded) {
                        if (state.messages.isEmpty) {
                          return SliverFillRemaining(
                            child: Center(
                              child: Text("Hali hech qanday xabar mavjud emas"),
                            ),
                          );
                        }

                        _scrollToEnd();

                        return SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (_, index) {
                              final message = state.messages[index];
                              final userId = widget.ticketDto.userId;

                              // Check if the message belongs to the current user
                              bool isMe = message.userId == userId;

                              // Check if the next message belongs to the current user
                              bool next = (index + 1 < state.messages.length) &&
                                  (state.messages[index + 1].userId == userId);

                              // Check if the previous message belongs to the current user
                              bool previous = (index > 0) &&
                                  (state.messages[index - 1].userId == userId);

                              return WMessageItem(
                                isMe: isMe,
                                message: message,
                                previous: previous,
                                next: next,
                              );
                            },
                            childCount: state.messages.length,
                          ),
                        );
                      } else if (state is TicketMessagesLoading) {
                        return SliverFillRemaining(
                          child: Center(
                            child: WLoader(),
                          ),
                        );
                      }

                      return SliverToBoxAdapter(child: SizedBox());
                    },
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(height: 16),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: widget.ticketDto.status != 'archived'
                ? Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Container(
                      width: double.infinity,
                      constraints: BoxConstraints(minHeight: 80),
                      decoration: BoxDecoration(color: AppColors.white),
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: messageController,
                              decoration: InputDecoration(
                                hintText: 'Sizning xabar...',
                              ),
                              maxLines: 3,
                              minLines: 1,
                            ),
                          ),
                          SizedBox(width: 12),
                          BlocBuilder<TicketMessagesBloc, TicketMessagesState>(
                            builder: (context, state) {
                              return WButton(
                                showLoader: state is TicketMessagesLoaded &&
                                    state.isLoading,
                                text: '',
                                child: SvgPicture.asset(
                                  AppIcons.send,
                                  colorFilter: ColorFilter.mode(
                                    AppColors.white,
                                    BlendMode.srcIn,
                                  ),
                                ),
                                onTap: () {
                                  final text = messageController.text.trim();
                                  if (text.isNotEmpty && text != "") {
                                    messageController.text = '';
                                    FocusScope.of(context).unfocus();
                                    ticketMessagesBloc.add(
                                      SendNewMessage(
                                        body: text,
                                      ),
                                    );
                                  }
                                },
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
