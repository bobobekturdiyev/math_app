import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:math_app/core/di/locator.dart';
import 'package:math_app/core/resources/data_state.dart';
import 'package:math_app/core/state/bloc/auth/auth_bloc.dart';
import 'package:math_app/core/util/validator.dart';
import 'package:math_app/features/profile/domain/entity/profile_update/profile_update_request.dart';
import 'package:math_app/features/profile/domain/repositories/profile_repo.dart';

part 'profile_update_event.dart';
part 'profile_update_state.dart';

class ProfileUpdateBloc extends Bloc<ProfileUpdateEvent, ProfileUpdateState> {
  final ProfileRepo _profileRepo = locator<ProfileRepo>();

  ProfileUpdateBloc() : super(ProfileUpdateInitial()) {
    on<SendProfileUpdateCredentialsEvent>(_sendProfileUpdateCredentialsEvent);
  }

  Future<FutureOr<void>> _sendProfileUpdateCredentialsEvent(
      SendProfileUpdateCredentialsEvent event,
      Emitter<ProfileUpdateState> emit) async {
    emit(ProfileUpdateLoading());

    Map<String, String> errorData = {};
    bool hasError = false;

    if (!Validator.validateName(event.profileUpdateRequest.name)) {
      errorData['name'] = "Iltimos, to'g'ri ism kiriting";
      hasError = true;
    }

    if (!Validator.validateName(event.profileUpdateRequest.surname)) {
      errorData['surname'] = "Iltimos, to'g'ri ism kiriting";
      hasError = true;
    }

    if (hasError) {
      emit(ProfileUpdateValidationError(error: errorData));
    } else {
      final result = await _profileRepo.profileUpdate(
          profileUpdateRequest: event.profileUpdateRequest);

      if (result is DataSuccess && result.data != null) {
        emit(ProfileUpdateSuccess());
        locator<AuthBloc>().add(AssignUser(user: result.data!));
      } else {
        emit(ProfileUpdateError(message: result.errorMessage ?? ""));
      }
    }
  }
}
