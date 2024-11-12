import 'dart:io';

import 'package:dio/dio.dart';
import 'package:math_app/core/resources/data_response.dart';
import 'package:math_app/core/resources/default_response.dart';
import 'package:math_app/features/profile/data/model/all_info_dto/skills_dto/skills_dto.dart';
import 'package:math_app/features/profile/data/model/all_info_dto/user_dto/user_dto.dart';
import 'package:math_app/features/profile/data/model/pay_dto/pay_dto.dart';
import 'package:math_app/features/profile/data/model/plan_dto/plan_dto.dart';
import 'package:math_app/features/profile/domain/entity/pay_request/pay_request.dart';
import 'package:math_app/features/profile/domain/entity/protfolio_reqs/about_req/about_req.dart';
import 'package:math_app/features/profile/domain/entity/protfolio_reqs/exp_req/exp_req.dart';
import 'package:math_app/features/profile/domain/entity/protfolio_reqs/language_req/language_req.dart';
import 'package:math_app/features/profile/domain/entity/update_password/update_password_req.dart';
import 'package:retrofit/retrofit.dart';


import '../../../../core/network/urls.dart';
import '../../domain/entity/protfolio_reqs/award_req/award_req.dart';
import '../../domain/entity/protfolio_reqs/edu_req/edu_req.dart';
import '../../domain/entity/protfolio_reqs/skills_req/skills_req.dart';
import '../model/all_info_dto/all_info_dto.dart';
import '../model/balance_history/balance_history.dart';
import '../model/response_dto.dart';
import '../model/update_password_dto/update_password_dto.dart';

part 'profile_service.g.dart';

@RestApi(baseUrl: Urls.baseURl)
abstract class ProfileService {
  factory ProfileService(Dio dio, {String baseUrl}) = _ProfileService;


  @GET("/get-plan-all")
  Future<HttpResponse<DefaultResponse<PlanDto>>> getAllPlan();
  @GET("/all-info")
  Future<HttpResponse<DataResponse<AllInfoDto>>> getUserData();
  @GET("/get-skill/{text}")
  Future<HttpResponse<DefaultResponse<SkillsDto>>> getSkills({
  @Path() required String text
});
  // @GET("/export-portfolio")
  // Future<HttpResponse<File>> getPortfolio();

  @GET("/get-balance-histories")
  Future<HttpResponse<DefaultResponse<BalanceHistoryDto>>> getBalanceHistories();

  @POST("/pay-from-balance")
  Future<HttpResponse<PayDto>> payFromBalance({
 @Body() required PayRequest payRequest
});

  @POST("/change-password-student")
  Future<HttpResponse<UpdatePasswordDto>> updatePassword({
 @Body() required UpdatePasswordReq updatePasswordReq
});
  @POST("/portfolio-skill")
  Future<HttpResponse<ResponseDto>> addSkills({
 @Body() required SkillsReq skillsReq
});
  @PUT("/update-skill")
  Future<HttpResponse<ResponseDto>> updateSkills({
 @Body() required SkillsReq skillsReq
});

  @PUT("/update-about")
  Future<HttpResponse<ResponseDto>> aboutUpdate({
 @Body() required AboutReq aboutReq
});

  @POST("/logout")
  Future<HttpResponse<UpdatePasswordDto>> logOut();

  @POST("/language")
  Future<HttpResponse<ResponseDto>> addLanguage({
    @Body() required  LanguageReq languageReq
  });
  @PUT("/language/{id}")
  Future<HttpResponse<ResponseDto>> updateLang({
    @Path() required int id,
    @Body() required  LanguageReq languageReq
  });

  @DELETE("/language/{id}")
  Future<HttpResponse<ResponseDto>> deleteLang({
    @Path() required int id,

  });

  //exp
  @POST("/portfolio-experience")
  Future<HttpResponse<ResponseDto>> addExp({
    @Body() required ExpReq expReq
  });

  @PUT("/portfolio-experience/{id}")
  Future<HttpResponse<ResponseDto>> updateExp({
    @Path() required int id,
    @Body() required ExpReq expReq
  });
  @DELETE("/portfolio-experience/{id}")
  Future<HttpResponse<ResponseDto>> deleteExp({
    @Path() required int id,
  //edu
  });  @POST("/portfolio-education")
  Future<HttpResponse<ResponseDto>> addEdu({
    @Body() required EduReq eduReq
  });

  @PUT("/portfolio-education/{id}")
  Future<HttpResponse<ResponseDto>> updateEdu({
    @Path() required int id,
    @Body() required EduReq eduReq
  });
  @DELETE("/portfolio-education/{id}")
  Future<HttpResponse<ResponseDto>> deleteEdu({
    @Path() required int id,

});

  //award
  @POST("/portfolio-award")
  Future<HttpResponse<ResponseDto>> addAward({
    @Body() required AwardReq awardReq
  });

  @PUT("/portfolio-award/{id}")
  Future<HttpResponse<ResponseDto>> updateAward({
    @Path() required int id,
    @Body() required AwardReq awardReq
  });
  @DELETE("/portfolio-award/{id}")
  Future<HttpResponse<ResponseDto>> deleteAward({
    @Path() required int id,
  });

}
