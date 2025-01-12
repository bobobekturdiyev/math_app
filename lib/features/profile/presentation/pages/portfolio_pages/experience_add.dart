import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:math_app/core/resources/state_status.dart';
import 'package:math_app/core/widgets/w_form_loader.dart';
import 'package:math_app/core/widgets/w_textfield.dart';
import 'package:math_app/features/profile/domain/entity/protfolio_reqs/exp_req/exp_req.dart';
import 'package:math_app/features/profile/presentation/manager/experience_bloc/experience_bloc.dart';
import 'package:math_app/features/profile/presentation/widgets/w_bottom_buttons.dart';

import '../../../../../core/resources/app_icons.dart';
import '../../../../../core/resources/styles.dart';
import '../../manager/user_bloc/user_bloc.dart';

@RoutePage()
class ExperienceScreen extends StatefulWidget {
  final int? id;

  const ExperienceScreen({Key? key, this.id}) : super(key: key);

  @override
  State<ExperienceScreen> createState() => _ExperienceScreenState();
}

class _ExperienceScreenState extends State<ExperienceScreen> {
  late ExperienceBloc expBloc;
  late TextEditingController controller;
  late TextEditingController compController;
  late TextEditingController descController;
  String? fromDate;
  String? toDate;

  @override
  void initState() {
    expBloc = ExperienceBloc(profileRepo: context.read());
    init();
    super.initState();
  }

  init() {
    if (widget.id != null) {
      var exp = context
          .read<UserBloc>()
          .allInfoDto
          .experience
          .firstWhere((e) => e.id == widget.id);
      controller = TextEditingController(text: exp.title);
      compController = TextEditingController(text: exp.companyName);
      descController = TextEditingController(text: exp.description);
      fromDate = exp.fromDate;
      toDate = exp.fromDate;
    } else {
      controller = TextEditingController();
      compController = TextEditingController();
      descController = TextEditingController();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => expBloc,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          scrolledUnderElevation: 0,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    context.router.maybePop();
                  },
                  child: SvgPicture.asset(AppIcons.arrowLeft),
                ),
                Text("Experience", style: Styles.getTextStyle(fontSize: 16)),
                const SizedBox()
              ],
            ),
          ),
        ),
        body: BlocConsumer<ExperienceBloc, ExperienceState>(
          listener: (context, state) {
            if (state is ExpSuccess) {
              context.read<UserBloc>().add(GetUserData());
              context.router.maybePop();
            }
          },
          builder: (context, state) {
            if (state is ExpState) {
              return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        WTextField(
                          controller: controller,
                          label: "Title",
                          hint: "Ex: Programmer Uz",
                          errorText: state.errorData?['title'],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Expanded(child: WDate(onDateChange: (onDateChange) {
                            //   fromDate =
                            //       DateFormat("yyyy-MM-dd").format(onDateChange);},
                            //   date: fromDate,
                            // errorText: state.errorData?['fromDate'],
                            // )),
                            const SizedBox(
                              width: 16,
                            ),
                            // Expanded(child: WDate(onDateChange: (onDateChange) {
                            //   toDate =
                            //       DateFormat("yyyy-MM-dd").format(onDateChange);
                            // }, date: toDate,
                            // errorText: state.errorData?['toDate'],
                            // )),
                          ],
                        ),
                        WTextField(
                          controller: compController,
                          label: "Company",
                          hint: "Ex: Programmer Uz",
                          errorText: state.errorData?['company'],
                        ),
                        WTextField(
                          controller: descController,
                          label: "Description",
                          maxLines: 10,
                          errorText: state.errorData?['description'],
                        ),
                      ],
                    ),
                    if (state.status == StateStatus.loading) ...{
                      const WFormLoader()
                    }
                  ],
                ),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
        bottomNavigationBar: WBottomButtons(
          onTap: () {
            if (widget.id == null) {
              expBloc.add(AddExp(
                  expReq: ExpReq(
                      title: controller.text,
                      fromDate: fromDate ?? '',
                      toDate: toDate ?? "",
                      compName: compController.text,
                      description: descController.text)));
            } else {
              expBloc.add(EditExp(
                  expReq: ExpReq(
                      title: controller.text,
                      fromDate: fromDate ?? '',
                      toDate: toDate ?? "",
                      compName: compController.toString(),
                      description: descController.text),
                  id: widget.id!));
            }
          },
        ),
      ),
    );
  }
}
