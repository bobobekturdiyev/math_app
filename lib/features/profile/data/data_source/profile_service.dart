import 'dart:io';
import 'package:dio/dio.dart';
import 'package:math_app/core/network/urls.dart';
import 'package:math_app/core/resources/data_response.dart';
import 'package:math_app/core/resources/default_response.dart';
import 'package:math_app/core/shared/data/shared_models/user_model/user.dart';
import 'package:math_app/features/profile/data/model/update_password_dto/update_password_dto.dart';
import 'package:math_app/features/profile/domain/entity/update_password/update_password_req.dart';
import 'package:retrofit/retrofit.dart';




part 'profile_service.g.dart';

@RestApi(baseUrl: Urls.baseURl)
abstract class ProfileService {
  factory ProfileService(Dio dio, {String baseUrl}) = _ProfileService;



  @POST("/logout")
  Future<HttpResponse<UpdatePasswordDto>> logOut();


  @POST("/user/update-image")
  @MultiPart()
  Future<HttpResponse<User>> userImageUpdate({
    @Part() required File image,
  });



  @POST("/user-update")
  @MultiPart()
  Future<HttpResponse<User>> userUpdate({
    @Part() required String email,
    @Part() required String address,
    @Part() required String birthday,
  });



}
