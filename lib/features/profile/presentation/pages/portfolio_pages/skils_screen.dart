import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:math_app/core/resources/state_status.dart';
import 'package:math_app/core/widgets/w_button.dart';
import 'package:math_app/core/widgets/w_text_link.dart';
import 'package:math_app/features/profile/presentation/manager/profile_bloc/profile_bloc.dart';
import 'package:math_app/features/profile/presentation/manager/user_bloc/user_bloc.dart';
import 'package:math_app/features/profile/presentation/widgets/portfolio_widgets/w_skills.dart';

import '../../../../../core/resources/app_icons.dart';
import '../../../../../core/resources/styles.dart';

@RoutePage()
class SkillsScreen extends StatefulWidget {
  const SkillsScreen({Key? key}) : super(key: key);

  @override
  State<SkillsScreen> createState() => _SkillsScreenState();
}

class _SkillsScreenState extends State<SkillsScreen> {
  final TextEditingController skillController = TextEditingController();
  List<int> skills = [];

  @override
  void initState() {
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
              Text("Skills", style: Styles.getTextStyle(fontSize: 16)),
              const SizedBox()
            ],
          ),
        ),
      ),
      body: BlocListener<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is SkillsState) {
            if (state.status == StateStatus.success) {
              context.read<UserBloc>().add(GetUserData());
              context.router.maybePop();
            }
          }
        },
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state is SkillsState) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    if (state.status == StateStatus.error) ...{
                      Text(state.error!)
                    },
                    WSkills(
                      tags: (isAdd, tags) {
                        if (isAdd) {
                          skills.add(tags);
                        } else {
                          skills.remove(tags);
                        }
                      },
                      skillList: state.skills,
                    )
                  ],
                ),
              );
            } else {
              return const SizedBox();
            }
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
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state is SkillsState) {
              return Row(
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
                        context.read<ProfileBloc>().add(SkillsAdd(
                            status: StateStatus.loaded, tags: skills));
                      })
                ],
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
