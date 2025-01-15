import 'package:dio/dio.dart';
import 'package:math_app/features/auth/data/models/user.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/network/urls.dart';
import '../../domain/entity/profile_update/profile_update_request.dart';

part 'profile_service.g.dart';

@RestApi(baseUrl: Urls.baseURl)
abstract class ProfileService {
  factory ProfileService(Dio dio, {String baseUrl}) = _ProfileService;

  @POST("/profile/update")
  Future<HttpResponse<User>> profileUpdate(
      {@Body() required ProfileUpdateRequest profileUpdateRequest});
}
