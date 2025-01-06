import 'dart:io';

import 'package:auto_route/annotations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:math_app/core/resources/app_colors.dart';
import 'package:math_app/core/resources/app_icons.dart';
import 'package:math_app/core/resources/state_status.dart';
import 'package:math_app/core/shared/data/shared_models/user_model/user.dart';
import 'package:math_app/core/state/bloc/main_data/user_bloc.dart';
import 'package:math_app/core/widgets/w_appbar.dart';
import 'package:math_app/core/widgets/w_textfield.dart';
import 'package:math_app/features/profile/presentation/manager/profile_bloc/profile_bloc.dart';
import 'package:math_app/features/profile/presentation/widgets/w_profile_avatar.dart';

@RoutePage()
class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({super.key});

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  late UserBloc userBloc;
  late ProfileBloc profileBloc;
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _birthController = TextEditingController();

  @override
  void initState() {
    userBloc = context.read<UserBloc>();
    profileBloc = ProfileBloc(profileRepo: context.read());

    setUserInfo(userBloc.user);

    super.initState();
  }

  setUserInfo(User? user) {
    _firstNameController.text = user?.name ?? '';
    _lastNameController.text = user?.lastName ?? '';
    _phoneController.text = user?.phone ?? '';
    _birthController.text = user?.birthday ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => profileBloc,
      child: BlocListener<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state.stateStatus == StateStatus.loaded) {
            userBloc.add(GetMeEvent());
            setUserInfo(state.user);
          }
        },
        child: Scaffold(
          appBar: WAppBar(
            title: "personal_information".tr(),
            trailing: GestureDetector(
              onTap: () {
                profileBloc.add(
                  UpdateUserInfo(
                    email: '',
                    address: '',
                    birthday: _birthController.text,
                  ),
                );
              },
              child: SvgPicture.asset(
                AppIcons.checkRoundBadge,
              ),
            ),
          ),
          backgroundColor: AppColors.backgroundColor,
          body: BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              if (state.stateStatus == StateStatus.loading ||
                  context.watch<UserBloc>().user == null) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state.stateStatus == StateStatus.loaded ||
                  state.stateStatus == StateStatus.normal) {
                return SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 32,
                      ),
                      Center(
                        child: state.userImageState == UserImageState.loading
                            ? const CircularProgressIndicator()
                            : Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 3),
                                    child: WProfileAvatar(
                                      borderColor: AppColors.green,
                                      borderWidth: 2,
                                      imageUrl: userBloc.user?.image,
                                    ),
                                  ),
                                  Positioned(
                                    right: 3,
                                    bottom: 0,
                                    child: GestureDetector(
                                      onTap: () async {
                                        final ImagePicker picker =
                                            ImagePicker();
                                        final XFile? image =
                                            await picker.pickImage(
                                                source: ImageSource.gallery);
                                        if (image?.path != null) {
                                          uploadImage(image!.path);
                                        }
                                      },
                                      child: SvgPicture.asset(
                                        AppIcons.cameraCircleFilled,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                      ),
                      const SizedBox(
                        height: 26,
                      ),
                      WTextField(
                        prefixIcon: _buildTextFieldIcon(
                          AppIcons.user,
                        ),
                        controller: _firstNameController,
                        label: "first_name".tr(),
                      ),
                      WTextField(
                        prefixIcon: _buildTextFieldIcon(
                          AppIcons.user,
                        ),
                        controller: _lastNameController,
                        label: "last_name".tr(),
                      ),

                      WTextField(
                        readOnly:  true,
                        prefixIcon: _buildTextFieldIcon(
                          AppIcons.phone,
                        ),
                        suffixIcon: _buildTextFieldIcon(AppIcons.check,
                            color: AppColors.green),
                        controller: _phoneController,
                        label: "phone_number".tr(),
                      ),

                      WTextField(
                        prefixIcon: _buildTextFieldIcon(
                          AppIcons.calendar,
                        ),
                        controller: _birthController,
                        label: "birth_date".tr(),
                      ),
                    ],
                  ),
                );
              } else if (state.stateStatus == StateStatus.error) {
                return Center(
                  child: Text(state.error ?? 'Error'),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildTextFieldIcon(String path,
          {Color color = AppColors.subTextColor}) =>
      SvgPicture.asset(
        path,
        colorFilter: ColorFilter.mode(
          color,
          BlendMode.srcIn,
        ),
        fit: BoxFit.none,
      );

  void uploadImage(String path) {
    profileBloc.add(
      UpdateProfileIMage(
        image: File(path),
      ),
    );
  }
}
