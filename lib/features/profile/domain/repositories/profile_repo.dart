import '../../../../core/resources/data_state.dart';
import '../../../auth/data/models/user.dart';
import '../entity/profile_update/profile_update_request.dart';

abstract class ProfileRepo {
  Future<DataState<User>> profileUpdate(
      {required ProfileUpdateRequest profileUpdateRequest});
}
