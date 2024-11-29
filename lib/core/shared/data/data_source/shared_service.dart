
import 'package:dio/dio.dart';
import 'package:math_app/core/resources/default_response.dart';
import 'package:math_app/features/auth/data/models/login_response.dart';
import 'package:math_app/core/shared/data/shared_models/user_model/user.dart';
import 'package:math_app/features/auth/domain/entities/login_request.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';


import '../../../../core/network/urls.dart';

part 'shared_service.g.dart';

@RestApi(baseUrl: Urls.baseURl)
abstract class SharedService {
  factory SharedService(Dio dio, {String baseUrl}) = _SharedService;

  @GET("/get-Me")
  Future<HttpResponse<User>> getMe();

}
