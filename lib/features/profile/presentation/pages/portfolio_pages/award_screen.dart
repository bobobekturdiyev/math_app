import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:math_app/core/resources/state_status.dart';
import 'package:math_app/core/widgets/w_date.dart';
import 'package:math_app/core/widgets/w_form_loader.dart';
import 'package:math_app/core/widgets/w_textfield.dart';
import 'package:math_app/features/profile/domain/entity/protfolio_reqs/award_req/award_req.dart';
import 'package:math_app/features/profile/presentation/manager/award_bloc/award_bloc.dart';
import 'package:math_app/features/profile/presentation/widgets/w_bottom_buttons.dart';

import '../../../../../core/resources/app_icons.dart';
import '../../../../../core/resources/styles.dart';
import '../../manager/user_bloc/user_bloc.dart';

@RoutePage()
class AwardScreen extends StatefulWidget {
  final int? id;

  const AwardScreen({Key? key, this.id}) : super(key: key);

  @override
  State<AwardScreen> createState() => _AwardScreenState();
}

class _AwardScreenState extends State<AwardScreen> {
  late TextEditingController controller;
  late TextEditingController descController;
  late TextEditingController linkController;
  late AwardBloc awardBloc;


  @override
  void initState() {
    awardBloc = AwardBloc(profileRepo: context.read());
    init();
    super.initState();
  }

  init() {
    if (widget.id != null) {
      var award = context
          .read<UserBloc>()
          .allInfoDto
          .award
          .firstWhere((e) => e.id == widget.id);
      controller = TextEditingController(text: award.title);
      descController = TextEditingController(text: award.description);
      linkController = TextEditingController(text: award.link);
    } else {
      controller = TextEditingController();
      linkController = TextEditingController();
      descController = TextEditingController();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => awardBloc,
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


        body: BlocConsumer<AwardBloc, AwardState>(
          listener: (context, state) {
            if(state is AwardSuccess){
              context.read<UserBloc>().add(GetUserData());
              context.router.pop();
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Stack(
                children: [
                  Column(
                    children: [
                      WTextField(
                        controller: controller,
                        label: "Title",
                        hint: "Ex: Flutter",
                      ),
                      WTextField(
                        controller: descController,
                        label: "Description",
                      ),
                      WTextField(
                        controller: linkController,
                        label: "Link",
                      ),
                    ],
                  ),
                  if(state.status==StateStatus.loading)...{
                    const WFormLoader()
                  }
                ],
              ),
            );
          },
        ),
        bottomNavigationBar: WBottomButtons(onTap: () {
          if (widget.id == null) {
            awardBloc.add(AddAward(
                awardReq: AwardReq(
                    title: controller.text,

                    link: linkController.text, description: descController.text)));
          }
          else {
              awardBloc.add(EditAward(
                  awardReq: AwardReq(
                      title: controller.text,
                      link: linkController.text,
                      description: descController.text),
                  id: widget.id!));
            }
        },),
      ),
    );
  }
}
