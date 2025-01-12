import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:math_app/core/resources/state_status.dart';
import 'package:math_app/core/widgets/w_bottomsheet.dart';
import 'package:math_app/core/widgets/w_form_field_holder.dart';
import 'package:math_app/core/widgets/w_radio_group.dart';
import 'package:math_app/core/widgets/w_textfield.dart';
import 'package:math_app/features/profile/presentation/manager/profile_bloc/profile_bloc.dart';
import 'package:math_app/features/profile/presentation/manager/user_bloc/user_bloc.dart';
import 'package:math_app/features/profile/presentation/widgets/w_bottom_buttons.dart';

import '../../../../../core/di/locator.dart';
import '../../../../../core/resources/app_icons.dart';
import '../../../../../core/resources/styles.dart';

@RoutePage()
class LanguageEditScreen extends StatefulWidget {
  final int? id;

  const LanguageEditScreen({Key? key, this.id}) : super(key: key);

  @override
  State<LanguageEditScreen> createState() => _LanguageEditScreenState();
}

class _LanguageEditScreenState extends State<LanguageEditScreen> {
  late TextEditingController controller;

  @override
  void initState() {
    init();
    super.initState();
  }

  init() {
    if (widget.id != null) {
      var lang = context
          .read<UserBloc>()
          .allInfoDto
          .languages
          ?.firstWhere((e) => e.id == widget.id);
      controller = TextEditingController(text: lang?.language);
    } else {
      controller = TextEditingController();
    }
  }

  int level = -1;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state is LangState) {
          if (state.status == StateStatus.success) {
            context.read<UserBloc>().add(GetUserData());
            context.router.maybePop();
          }
        }
      },
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
                Text("Skills", style: Styles.getTextStyle(fontSize: 16)),
                const SizedBox()
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(children: [
            WTextField(
              controller: controller,
              label: "Language",
            ),
            const SizedBox(
              height: 16,
            ),
            WFormFieldHolder(
                child: GestureDetector(
              onTap: levelSheet,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Daraja'),
              ),
            ))
          ]),
        ),
        bottomNavigationBar: WBottomButtons(
          onTap: () {
            if (widget.id != null) {
              context.read<ProfileBloc>().add(UpdateLang(
                  lang: controller.text, level: level, id: widget.id!));
            } else {
              context
                  .read<ProfileBloc>()
                  .add(LanguageAdd(lang: controller.text, level: level));
            }
          },
        ),
      ),
    );
  }

  levelSheet() {
    showModalBottomSheet(
        context: locator<GlobalKey<ScaffoldState>>().currentContext!,
        builder: (ctx) {
          return WBottomSheet(
            title: "Daraja",
            body: Column(children: [
              WRadioGroup(
                  items: [
                    "Beginner",
                    "Elementary",
                    "Advanced",
                  ],
                  onChange: (aa) {
                    level = aa;
                    context.router.maybePop();
                  })
            ]),
          );
        });
  }
}
