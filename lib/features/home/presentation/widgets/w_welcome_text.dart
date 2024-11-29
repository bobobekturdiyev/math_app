import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_app/core/resources/app_colors.dart';
import 'package:math_app/core/resources/state_status.dart';
import 'package:math_app/core/resources/styles.dart';
import 'package:math_app/core/state/bloc/main_data/user_bloc.dart';
import 'package:math_app/core/widgets/w_shimmer_loader.dart';

class WWelcomeText extends StatelessWidget {
  const WWelcomeText({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            state.stateStatus==StateStatus.loaded ?
            Text(
              "hi_user".tr(namedArgs: {"name": "${state.user?.name}"}),
              style: Styles.getHiUserStyle(),
            ) : const WShimmerLoader(shimmerMode: WShimmerMode.light,),
            Row(
              children: [
                Text(
                  "suit_yourself".tr(),
                  style: Styles.getTextStyle(
                    fontSize: 12,
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  "course_model".tr(),
                  style: Styles.getTextStyle(
                    fontSize: 12,
                    color: AppColors.primaryColor,
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  "find".tr(),
                  style: Styles.getTextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
