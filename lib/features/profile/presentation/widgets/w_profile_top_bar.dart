import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:math_app/core/di/injector.dart';
import 'package:math_app/core/resources/app_icons.dart';
import 'package:math_app/core/resources/app_images.dart';
import 'package:math_app/core/resources/styles.dart';
import 'package:math_app/core/state/bloc/main_data/user_bloc.dart';
import 'package:math_app/features/profile/presentation/widgets/w_profile_avatar.dart';

class WProfileTopBar extends StatelessWidget {
  const WProfileTopBar({super.key});

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        Image.asset(
          AppImages.chatMask,
          // height: 280,
          // width: double.infinity,
          // fit: BoxFit.cover,
        ),
        Positioned.fill(
            child: BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                return Padding(

                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "my_profile".tr(),
                            style: Styles.getProfileTitle(),
                          ),
                          SvgPicture.asset(
                            AppIcons.dotsBadge,
                            colorFilter:
                            const ColorFilter.mode(
                                Colors.white, BlendMode.srcIn),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      WProfileAvatar(imageUrl: state.user?.image,),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "${state.user?.name} ${state.user?.lastName}",
                        style: Styles.getProfileTitle(),
                      ),
                      Text(
                        state.user?.email ?? '',
                        style: Styles.getProfileSubTitle(),
                      ),
                    ],
                  ),
                );
              },
            ))
      ],
    );
  }
}
