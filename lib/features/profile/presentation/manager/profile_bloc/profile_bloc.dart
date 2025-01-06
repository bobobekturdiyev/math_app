import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:math_app/core/shared/data/shared_models/user_model/user.dart';
import 'package:meta/meta.dart';
import 'package:math_app/core/resources/data_state.dart';
import 'package:math_app/core/resources/state_status.dart';

import '../../../domain/repositories/profile_repo.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepo profileRepo;

  ProfileBloc({required this.profileRepo}) : super(const ProfileState()) {
    on<UpdateProfileIMage>((event, emit) async {
      emit(state.copyWith(userImageState: UserImageState.loading,));

      final response = await profileRepo.updateUserImage(image: event.image);
      if (response is DataSuccess) {
        emit(
          state.copyWith(
            stateStatus: StateStatus.loaded,
            userImageState: UserImageState.loaded,
            user: response.data
          ),
        );
      } else {
        emit(state.copyWith(
            stateStatus: StateStatus.error,
            error: response.errorResponse?.message ??
                response.errorResponse?.errors?[0] ??
                "Nimadir xato bo'ldi",),);
      }
    });

    on<UpdateUserInfo>((event, emit) async {
      emit(
        state.copyWith(stateStatus: StateStatus.loading,

        ),
      );
      final response = await profileRepo.updateProfileInfo(
        address: event.address,
        email: event.email,
        birthday: event.birthday,
      );
      if (response is DataSuccess) {
        emit(
          state.copyWith(stateStatus: StateStatus.loaded,
              user: response.data

          ),
        );
      } else {
        emit(
          state.copyWith(
            stateStatus: StateStatus.error,
            error: response.errorResponse?.message ??
                response.errorResponse?.errors?[0] ??
                "Nimadir xato bo'ldi",
          ),
        );
      }
    });
  }
}
