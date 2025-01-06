import 'dart:io';

import 'package:math_app/core/error/exception_handler.dart';
import 'package:math_app/core/resources/data_state.dart';
import 'package:math_app/core/shared/data/shared_models/user_model/user.dart';
import 'package:math_app/features/profile/data/data_source/profile_service.dart';
import 'package:math_app/features/profile/domain/repositories/profile_repo.dart';

class ImplProfileRepo extends ProfileRepo {
  final ProfileService profileService;

  ImplProfileRepo({
    required this.profileService,
  });

  @override
  Future<DataState> logout() async {
    try {
      final response = await profileService.logOut();
      return DataSuccess(data: response);
    } catch (e) {
      return DataException.getError(e);
    }
  }

  @override
  Future<DataState<User>> updateUserImage({required File image}) async {
    try {
      final response = await profileService.userImageUpdate(image: image);
      return DataSuccess<User>(data: response.data);
    } catch (e) {
      return DataException.getError<User>(e);
    }
  }

  @override
  Future<DataState<User>> updateProfileInfo(
      {required String address,
      required String email,
      required String birthday}) async {
    try {
      final response = await profileService.userUpdate(
        email: email,
        address: address,
        birthday: birthday,
      );
      return DataSuccess<User>(data: response.data);
    } catch (e) {
      return DataException.getError<User>(e);
    }
  }
}
