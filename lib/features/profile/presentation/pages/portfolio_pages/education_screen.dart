import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:math_app/core/resources/state_status.dart';
import 'package:math_app/core/widgets/w_form_loader.dart';
import 'package:math_app/core/widgets/w_textfield.dart';
import 'package:math_app/features/profile/domain/entity/protfolio_reqs/edu_req/edu_req.dart';
import 'package:math_app/features/profile/presentation/manager/education_bloc/education_bloc.dart';
import 'package:math_app/features/profile/presentation/widgets/w_bottom_buttons.dart';

import '../../../../../core/resources/app_icons.dart';
import '../../../../../core/resources/styles.dart';
import '../../../../../core/widgets/w_date.dart';
import '../../manager/user_bloc/user_bloc.dart';

@RoutePage()
class EducationScreen extends StatefulWidget {
  final int? id;

  const EducationScreen({Key? key, this.id}) : super(key: key);

  @override
  State<EducationScreen> createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> {
  late final TextEditingController controller;
  late final TextEditingController linkController;
  late EducationBloc eduBloc;
  String? fromDate;
  String? toDate;


  @override
  void initState() {
    eduBloc = EducationBloc(profileRepo: context.read());
    init();
    super.initState();
  }

  init() {
    if (widget.id != null) {
      var edu = context
          .read<UserBloc>()
          .allInfoDto
          .education
          .firstWhere((e) => e.id == widget.id);
      controller = TextEditingController(text: edu.universityName);
      linkController = TextEditingController(text: edu.website);
      fromDate = edu.fromDate;
      toDate = edu.fromDate;
    } else {
      controller = TextEditingController();
      linkController = TextEditingController();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => eduBloc,
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
                    context.router.pop();
                  },
                  child: SvgPicture.asset(AppIcons.arrowLeft),
                ),
                Text("Experience", style: Styles.getTextStyle(fontSize: 16)),
                const SizedBox()
              ],
            ),
          ),
        ),
        body: BlocConsumer<EducationBloc, EducationState>(
          listener: (context, state) {
            if(state is EduState){
              context.read<UserBloc>().add(GetUserData());
              context.router.pop();
            }
            },
          builder: (context, state) {

            if(state is EduState){
              return         SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        WTextField(controller: controller,
                          label: "Title",
                          hint: "Ex: Programmer Uz",
                          errorText: state.errorData?['university'],
                        ),

                        WTextField(controller: linkController,
                          label: "link",
                          errorText:  state.errorData?['website'],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Expanded(child: WDate(onDateChange: (onDateChange) {
                            //   fromDate =
                            //       DateFormat("yyyy-MM-dd").format(onDateChange);
                            // },
                            //   date: fromDate,
                            //   errorText: state.errorData?['fromDate'],
                            // )),
                            const SizedBox(width: 16,),
                            // Expanded(child: WDate(onDateChange: (onDateChange) {
                            //   toDate =
                            //       DateFormat("yyyy-MM-dd").format(onDateChange);
                            // }, date: toDate,
                            //   errorText: state.errorData?['toDate'],
                            // )),

                          ],
                        ),
                      ],
                    ),
                    if(state.status==StateStatus.loading)...{
                      const WFormLoader()
                    }
                  ],

                ),
              );
            }else{
              return const SizedBox();
            }

          },
        ),
        bottomNavigationBar: WBottomButtons(
          onTap: () {
            if (widget.id == null) {
              eduBloc.add(AddEdu(
                  eduReq: EduReq(
                      university: controller.text,
                      fromDate: fromDate ?? '',
                      toDate: toDate ?? "",
                      website: linkController.text)));
            }
            else {
              eduBloc.add(EditEdu(
                  eduReq: EduReq(
                      university: controller.text,
                      fromDate: fromDate ?? '',
                      toDate: toDate ?? "",
                      website: linkController.text),
                  id: widget.id!));
            }
          },
        ),
      ),
    );
  }
}
