
import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:math_app/features/profile/domain/entity/update_password/update_password_req.dart';

import '../../../../../core/resources/data_state.dart';
import '../../../../../core/resources/state_status.dart';
import '../../../../../core/util/validator.dart';
import '../../../domain/repositories/profile_repo.dart';

part 'update_password_event.dart';
part 'update_password_state.dart';

class UpdatePasswordBloc extends Bloc<UpdatePasswordEvent, UpdatePasswordState> {
  final ProfileRepo profileRepo;

  UpdatePasswordBloc({required this.profileRepo}) : super(UpdatePasswordInitial()) {
    on<UpdatePassword>((event, emit)async {
      final Map<String, String?> errors = {
        'password': null,
        'confirm_password': null,
      };

      bool hasError = false;
      if (!Validator.validatePassword(event.password)) {
        hasError = true;
        errors['password'] = 'password_not_valid'.tr();
      }

      if (!Validator.validatePassword(event.confirmPassword)) {
        hasError = true;
        errors['confirm_password'] = 'password_not_valid'.tr();
      }

      if (event.password != event.confirmPassword) {
        hasError = true;
        errors['password'] = 'passwords_not_same'.tr();
        errors['confirm_password'] = 'passwords_not_same'.tr();
      }

      if (hasError) {
        emit(UpdatePasswordInitial(status: StateStatus.error, errorData: errors));
      } else {
        emit( UpdatePasswordInitial(status: StateStatus.loading));
        final result = await profileRepo.updatePassword(
            updatePasswordReq: UpdatePasswordReq(
                password: event.password, confirmPassword: event.confirmPassword));

        if (result is DataSuccess && result.data?.code==200) {
          emit( UpdatePasswordInitial(status: StateStatus.success));
        } else {
          emit(UpdatePasswordInitial(
            status: StateStatus.error,
            error: result.errorResponse?.message ?? result.errorResponse?.errors?[0],
          ));
        }
      }

    });
  }
}
