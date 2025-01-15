import 'package:math_app/core/error/exception_handler.dart';
import 'package:math_app/core/resources/data_state.dart';
import 'package:math_app/features/profile/data/data_source/profile_service.dart';
import 'package:math_app/features/profile/domain/entity/profile_update/profile_update_request.dart';
import 'package:math_app/features/profile/domain/repositories/profile_repo.dart';

import '../../../auth/data/models/user.dart';

class ImplProfileRepo extends ProfileRepo {
  final ProfileService profileService;

  ImplProfileRepo({
    required this.profileService,
  });

  @override
  Future<DataState<User>> profileUpdate(
      {required ProfileUpdateRequest profileUpdateRequest}) async {
    try {
      final response = await profileService.profileUpdate(
          profileUpdateRequest: profileUpdateRequest);

      return DataSuccess<User>(data: response.data);
    } catch (e) {
      return DataException.getError<User>(e);
    }
  }
}
