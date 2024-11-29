
import 'package:dio/dio.dart';
import 'package:math_app/core/resources/default_response.dart';
import 'package:math_app/features/auth/data/models/login_response.dart';
import 'package:math_app/core/shared/data/shared_models/user_model/user.dart';
import 'package:math_app/features/auth/domain/entities/login_request.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';


import '../../../../core/network/urls.dart';

part 'auth_service.g.dart';

@RestApi(baseUrl: Urls.baseURl)
abstract class AuthService {
  factory AuthService(Dio dio, {String baseUrl}) = _AuthService;

  @POST("/student-login")
  Future<HttpResponse<LoginResponse>> login(
    @Body() LoginRequest loginRequest,
  );

  @POST("/logout")
  Future<HttpResponse<DefaultResponse>> logout();

  @GET("/get-Me")
  Future<HttpResponse<User>> getMe();
//
// @GET("/courses/type/alif")
// Future<HttpResponse<List<Course>>> getAlifCourses();
//
// @GET("/course/{id}/modules")
// Future<HttpResponse<List<Module>>> getModules(@Path('id') int id);
}
