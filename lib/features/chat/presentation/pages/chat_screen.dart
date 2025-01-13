import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_app/config/routes/route_path.dart';
import 'package:math_app/config/routes/router.gr.dart';
import 'package:math_app/core/di/locator.dart';
import 'package:math_app/core/resources/app_colors.dart';
import 'package:math_app/core/resources/app_images.dart';
import 'package:math_app/core/state/bloc/auth/auth_bloc.dart';
import 'package:math_app/core/state/bloc/bottom_nav_bar/bottom_nav_bar_bloc.dart';
import 'package:math_app/core/widgets/w_button.dart';
import 'package:math_app/core/widgets/w_loader.dart';
import 'package:math_app/core/widgets/w_non_auth.dart';
import 'package:math_app/features/chat/presentation/manager/ticket/ticket_bloc.dart';
import 'package:math_app/features/chat/presentation/pages/add_ticket_page.dart';
import 'package:math_app/features/chat/presentation/widgets/w_ticket_item.dart';

@RoutePage()
class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: RefreshIndicator(
        backgroundColor: AppColors.white,
        color: AppColors.primaryColor,
        onRefresh: () async {
          locator<TicketBloc>().add(LoadTickets());
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 160,
              pinned: false,
              floating: false,
              backgroundColor: AppColors.primaryColor,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.only(left: 16, bottom: 72),
                title: Text(
                  'Savol-javob',
                  style: locator<ThemeData>().textTheme.headlineSmall?.copyWith(
                        color: Colors.white,
                      ),
                ),
                collapseMode: CollapseMode.parallax,
                background: Image.asset(
                  AppImages.chatBackground,
                  fit: BoxFit.cover,
                ),
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(0),
                child: Container(
                  width: double.infinity,
                  height: 32,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32.0),
                      topRight: Radius.circular(32.0),
                    ),
                  ),
                  child: Center(
                    child: Container(
                      width: 48,
                      height: 4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: AppColors.grey.withValues(alpha: 0.5)),
                    ),
                  ),
                ),
              ),
            ),
            if (!locator<AuthBloc>().loggedIn) ...{
              SliverToBoxAdapter(
                child: WNonAuth(
                  text:
                      "Savollar yubora olish uchun, dastlab, tizimga kirishingiz lozim",
                  onLoginTap: () {
                    locator<BottomNavBarBloc>()
                        .add(OpenPage(path: RoutePath.profile));
                  },
                ),
              )
            } else ...{
              BlocBuilder<TicketBloc, TicketState>(
                builder: (context, state) {
                  if (state is TicketLoaded) {
                    if (state.tickets.isEmpty) {
                      return SliverToBoxAdapter(
                        child: Center(
                          child: Text(
                            "Siz hali savol yubormagansiz",
                            style: locator<ThemeData>().textTheme.bodyMedium,
                          ),
                        ),
                      );
                    }
                    return SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              context.router.push(
                                TicketMessagesRoute(
                                  ticketDto: state.tickets[index],
                                ),
                              );
                            },
                            child: WTicketItem(
                              ticketDto: state.tickets[index],
                            ),
                          ),
                        ),
                        childCount: state.tickets.length,
                      ),
                    );
                  } else if (state is TicketLoading) {
                    return const SliverToBoxAdapter(
                      child: Center(
                        child: WLoader(),
                      ),
                    );
                  } else if (state is TicketError) {
                    return SliverToBoxAdapter(
                      child: Column(
                        children: [
                          Text(state.message),
                          WButton(
                            text: 'Qayta yuklash',
                            onTap: () {
                              locator<TicketBloc>().add(LoadTickets());
                            },
                          ),
                        ],
                      ),
                    );
                  } else {
                    return const SliverToBoxAdapter(
                      child: SizedBox(),
                    );
                  }
                },
              ),
            }
          ],
        ),
      ),
      floatingActionButton: locator<AuthBloc>().loggedIn
          ? FloatingActionButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isDismissible: false,
                  isScrollControlled: true,
                  useSafeArea: true,
                  backgroundColor: AppColors.white,
                  enableDrag: true,
                  builder: (_) => AddTicketPage(),
                );
              },
              backgroundColor: AppColors.primaryColorDark,
              child: Icon(
                Icons.add_comment_rounded,
                color: AppColors.white,
              ),
            )
          : null,
    );
  }
}
