import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_app/core/di/locator.dart';
import 'package:math_app/core/resources/app_colors.dart';
import 'package:math_app/core/state/bloc/auth/auth_bloc.dart';
import 'package:math_app/core/util/snackbar_helper.dart';
import 'package:math_app/core/widgets/w_button.dart';
import 'package:math_app/features/profile/domain/entity/profile_update/profile_update_request.dart';
import 'package:math_app/features/profile/presentation/manager/profile_update/profile_update_bloc.dart';

@RoutePage()
class ProfileUpdateScreen extends StatefulWidget {
  const ProfileUpdateScreen({super.key});

  @override
  State<ProfileUpdateScreen> createState() => _ProfileUpdateScreenState();
}

class _ProfileUpdateScreenState extends State<ProfileUpdateScreen> {
  late final TextEditingController nameController;
  late final TextEditingController surnameController;

  ProfileUpdateBloc profileUpdateBloc = ProfileUpdateBloc();

  List<TextEditingController> controllers = [];

  @override
  void initState() {
    super.initState();
    nameController =
        TextEditingController(text: locator<AuthBloc>().user?.name ?? "");
    surnameController =
        TextEditingController(text: locator<AuthBloc>().user?.surname ?? "");
  }

  @override
  void dispose() {
    super.dispose();

    for (var c in controllers) {
      c.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: profileUpdateBloc,
      child: BlocListener<ProfileUpdateBloc, ProfileUpdateState>(
        listener: (context, state) {
          if (state is ProfileUpdateSuccess) {
            FocusScope.of(context).unfocus();
            SnackbarHelper.showSuccess(
                context: context, text: 'Ma\'lumotlar yangilandi');
          } else if (state is ProfileUpdateError) {
            SnackbarHelper.showError(context: context, text: state.message);
          }
        },
        child: Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                floating: true,
                elevation: 0,
                scrolledUnderElevation: 0,
                backgroundColor: AppColors.white,
                titleSpacing: 0,
                title: Text(
                  'Ma\'lumotlarni tahrirlash',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              BlocBuilder<ProfileUpdateBloc, ProfileUpdateState>(
                builder: (context, state) {
                  return SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            "Ism",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          TextField(
                            controller: nameController,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              hintText: 'Ismingizni yozing',
                              errorText: state is ProfileUpdateValidationError
                                  ? state.error['name']
                                  : null,
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            "Familiya",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          TextField(
                            controller: surnameController,
                            decoration: InputDecoration(
                              hintText: 'Familiyangizni yozing',
                              errorText: state is ProfileUpdateValidationError
                                  ? state.error['surname']
                                  : null,
                            ),
                          ),
                          SizedBox(height: 16),
                          SizedBox(
                            width: double.infinity,
                            child: WButton(
                              text: 'Yangilash',
                              showLoader: state is ProfileUpdateLoading,
                              onTap: () {
                                profileUpdateBloc.add(
                                  SendProfileUpdateCredentialsEvent(
                                    profileUpdateRequest: ProfileUpdateRequest(
                                      name: nameController.text.trim(),
                                      surname: surnameController.text.trim(),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
