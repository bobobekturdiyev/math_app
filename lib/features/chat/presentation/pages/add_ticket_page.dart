import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:math_app/core/di/locator.dart';
import 'package:math_app/core/resources/app_colors.dart';
import 'package:math_app/core/resources/app_icons.dart';
import 'package:math_app/core/widgets/unfocus.dart';
import 'package:math_app/core/widgets/w_button.dart';
import 'package:math_app/features/chat/presentation/manager/add_ticket/add_ticket_bloc.dart';

import '../manager/ticket/ticket_bloc.dart';

class AddTicketPage extends StatefulWidget {
  const AddTicketPage({super.key});

  @override
  State<AddTicketPage> createState() => _AddTicketPageState();
}

class _AddTicketPageState extends State<AddTicketPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  AddTicketBloc addTicketBloc = AddTicketBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddTicketBloc>.value(
      value: addTicketBloc,
      child: Unfocus(
        child: Padding(
          padding: EdgeInsets.only(
            bottom:
                MediaQuery.of(context).viewInsets.bottom, // Adjust for keyboard
          ),
          child: SingleChildScrollView(
            child: BlocListener<AddTicketBloc, AddTicketState>(
              listener: (context, state) {
                if (state is AddTicketSuccess) {
                  locator<TicketBloc>().add(LoadTickets());
                  context.router.maybePop();
                }
              },
              child: BlocBuilder<AddTicketBloc, AddTicketState>(
                builder: (context, state) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    width: double.infinity,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 24,
                            ),
                            Container(
                              alignment: Alignment.center,
                              width: 48,
                              height: 4,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: AppColors.grey.withValues(alpha: 0.5)),
                            ),
                            GestureDetector(
                              onTap: () {
                                context.router.maybePop();
                              },
                              behavior: HitTestBehavior.opaque,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset(
                                  AppIcons.close,
                                  colorFilter: ColorFilter.mode(
                                      AppColors.grey, BlendMode.srcIn),
                                ),
                              ),
                            )
                          ],
                        ),
                        Text(
                          "Savol so'rash",
                          style: locator<ThemeData>().textTheme.headlineMedium,
                        ),
                        Text(
                          "Tushunmagan savolingizni yozishingiz mumkin",
                          style: locator<ThemeData>().textTheme.bodySmall,
                        ),
                        SizedBox(height: 16),
                        TextField(
                          controller: titleController,
                          decoration: InputDecoration(
                            hintText: 'Sarlavha yozing',
                            errorText: (state is AddTicketInitial)
                                ? (state.errorData?['title'])
                                : null,
                          ),
                          maxLength: 50,
                          textInputAction: TextInputAction.next,
                        ),
                        SizedBox(height: 12),
                        TextField(
                          controller: descriptionController,
                          decoration: InputDecoration(
                              hintText: 'Savolingiz mazmunini yozing',
                              errorText: (state is AddTicketInitial)
                                  ? (state.errorData?['body'])
                                  : null,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 16)),
                          minLines: 5,
                          maxLines: 5,
                          textInputAction: TextInputAction.done,
                        ),
                        SizedBox(height: 12),
                        SizedBox(
                          width: double.infinity,
                          child: WButton(
                            text: "Yuborish",
                            showLoader: state is AddTicketLoading,
                            onTap: () {
                              addTicketBloc.add(
                                SendTicketEvent(
                                  title: titleController.text.trim(),
                                  body: descriptionController.text.trim(),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
