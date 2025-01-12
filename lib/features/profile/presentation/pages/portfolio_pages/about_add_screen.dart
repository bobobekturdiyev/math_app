import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:math_app/core/resources/state_status.dart';
import 'package:math_app/core/widgets/w_button.dart';
import 'package:math_app/core/widgets/w_text_link.dart';
import 'package:math_app/core/widgets/w_textfield.dart';
import 'package:math_app/features/profile/presentation/manager/profile_bloc/profile_bloc.dart';
import 'package:math_app/features/profile/presentation/manager/user_bloc/user_bloc.dart';

import '../../../../../core/resources/app_icons.dart';
import '../../../../../core/resources/styles.dart';

@RoutePage()
class AboutAddScreen extends StatefulWidget {
  const AboutAddScreen({Key? key}) : super(key: key);

  @override
  State<AboutAddScreen> createState() => _AboutAddScreenState();
}

class _AboutAddScreenState extends State<AboutAddScreen> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController(
        text: context.read<UserBloc>().allInfoDto.student.about ?? '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Text("About", style: Styles.getTextStyle(fontSize: 16)),
              const SizedBox()
            ],
          ),
        ),
      ),
      body: BlocListener<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is AboutState) {
            if (state.status == StateStatus.success) {
              context.read<UserBloc>().add(GetUserData());
              context.router.maybePop();
            }
          }
        },
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: WTextField(
                    controller: controller,
                    label: "About",
                    maxLines: 12,
                    errorText: (state is AboutState) ? state.error : null,
                  ),
                ),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: Container(
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        margin:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        decoration:
            const BoxDecoration(border: Border(top: BorderSide(width: 1))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            WTextLink(
                text: "BEKOR QILISH",
                onTap: () {
                  context.router.maybePop();
                }),
            WButton(
                text: "SAQLASH",
                onTap: () {
                  context
                      .read<ProfileBloc>()
                      .add(AboutAdd(about: controller.text));
                })
          ],
        ),
      ),
    );
  }
}
