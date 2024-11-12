
import 'package:math_app/core/error/exception_handler.dart';
import 'package:math_app/core/resources/data_state.dart';
import 'package:math_app/features/profile/data/data_source/payme_service/payme_service.dart';
import 'package:math_app/features/profile/data/data_source/profile_service.dart';
import 'package:math_app/features/profile/data/model/all_info_dto/skills_dto/skills_dto.dart';
import 'package:math_app/features/profile/data/model/balance_history/balance_history.dart';
import 'package:math_app/features/profile/data/model/pay_dto/pay_dto.dart';
import 'package:math_app/features/profile/data/model/plan_dto/plan_dto.dart';
import 'package:math_app/features/profile/data/model/update_password_dto/update_password_dto.dart';
import 'package:math_app/features/profile/data/model/verify_code_dto/verify_code_dto.dart';
import 'package:math_app/features/profile/domain/entity/card_req/card_pay_req.dart';
import 'package:math_app/features/profile/domain/entity/code_req/code_req.dart';
import 'package:math_app/features/profile/domain/entity/pay_request/pay_request.dart';
import 'package:math_app/features/profile/domain/entity/protfolio_reqs/about_req/about_req.dart';
import 'package:math_app/features/profile/domain/entity/protfolio_reqs/award_req/award_req.dart';
import 'package:math_app/features/profile/domain/entity/protfolio_reqs/edu_req/edu_req.dart';
import 'package:math_app/features/profile/domain/entity/protfolio_reqs/exp_req/exp_req.dart';
import 'package:math_app/features/profile/domain/entity/protfolio_reqs/language_req/language_req.dart';
import 'package:math_app/features/profile/domain/entity/protfolio_reqs/skills_req/skills_req.dart';
import 'package:math_app/features/profile/domain/entity/token_req/token_req.dart';
import 'package:math_app/features/profile/domain/entity/update_password/update_password_req.dart';
import 'package:math_app/features/profile/domain/repositories/profile_repo.dart';

import '../model/all_info_dto/all_info_dto.dart';
import '../model/payme_dto/create_card_dto.dart';
import '../model/response_dto.dart';

class ImplProfileRepo extends ProfileRepo{
  final ProfileService profileService;
  final PaymeService paymeService;

  ImplProfileRepo({
    required this.profileService,
    required this.paymeService,
  });
  @override
  Future<DataState<List<PlanDto>>> getAllPlan()async {


    try{
      final response=await profileService.getAllPlan();


      return DataSuccess<List<PlanDto>>(data: response.data.data);
          }catch(e){
      print(e);
        return DataException.getError<List<PlanDto>>(e);

      }
  }

  @override
  Future<DataState<AllInfoDto>> getUserData()async {
    try{
      final response=await profileService.getUserData();
      return DataSuccess<AllInfoDto>(data:response.data.data);
    }catch(e){
      print(e);
      return DataException.getError<AllInfoDto>(e);

    }
  }

  @override
  Future<DataState<PayDto>> payFromBalance({required PayRequest payRequest})async {

    try{
      final response=await profileService.payFromBalance(payRequest: payRequest);

      return DataSuccess<PayDto>(data: response.data);
    }catch(e){
      return DataException.getError<PayDto>(e);
    }
  }

  @override
  Future<DataState<CardCreateDto>> payFromCard({required CardPayReq cardPayReq})async {
  try{
  final response=await paymeService.payFromCard(cardPayReq: cardPayReq);

  return DataSuccess<CardCreateDto>(data: response.data);
  }catch(e){
    print(e);
  return DataException.getError<CardCreateDto>(e);
  }
  }

  @override
  Future<DataState<VerifyCodeDto>> tokenVerify({required TokenReq tokenReq})async {
    try{
      final response=await paymeService.sendToken(  tokenReq: tokenReq);

      return DataSuccess<VerifyCodeDto>(data: response.data);
    }catch(e){
      print(e);
      return DataException.getError<VerifyCodeDto>(e);
    }

  }

  @override
  Future<DataState<CardCreateDto>> codeVerify({required CodeReq codeReq}) async{
    try{
      final response=await paymeService.sendCode(codeReq: codeReq  );

      return DataSuccess<CardCreateDto>(data: response.data);
    }catch(e){
      print(e);
      return DataException.getError<CardCreateDto>(e);
    }

  }

  @override
  Future<DataState<UpdatePasswordDto>> updatePassword({required UpdatePasswordReq updatePasswordReq})async {
      try{
        final response=await profileService.updatePassword(updatePasswordReq: updatePasswordReq);
        return DataSuccess<UpdatePasswordDto>(data: response.data);
      }catch(e){
        return DataException.getError<UpdatePasswordDto>(e);

      }
  }

  @override
  Future<DataState> logout()async {
    try{
      final response=await profileService.logOut();
      return DataSuccess(data: response);
    }catch(e){
      return DataException.getError(e);

    }

  }

  @override
  Future<DataState<List<BalanceHistoryDto>>> getBalanceHistories()async {
    try{
      final response=await profileService.getBalanceHistories();
      return DataSuccess<List<BalanceHistoryDto>>(data: response.response.data);
    }catch(e){
      return DataException.getError<List<BalanceHistoryDto>>(e);

    }
  }

  // @override
  // Future<DataState<File>> getPortfolio()async {
  //   try{
  //     final response=await profileService.getBalanceHistories();
  //     return DataSuccess<File>(data: response.response.data);
  //   }catch(e){
  //     print(e);
  //     return DataException.getError<File>(e);
  //
  //   }
  // }

  @override
  Future<DataState<ResponseDto>> updateAbout({required AboutReq req})async {
    try{
      final response=await profileService.aboutUpdate(aboutReq: req);
      return DataSuccess<ResponseDto>(data: response.data);
    }catch(e){
      print(e);
      return DataException.getError<ResponseDto>(e);

    }
  }

  @override
  Future<DataState<List<SkillsDto>>> getSkills({required String text})async {
    try{
      final response=await profileService.getSkills(text: text);
      return DataSuccess<List<SkillsDto>>(data: response.data.data);
    }catch(e){
      print(e);
      return DataException.getError<List<SkillsDto>>(e);

    }
  }

  @override
  Future<DataState<ResponseDto>> addSkills({required SkillsReq skillsReq})async {
    try{
      final response=await profileService.addSkills(skillsReq: skillsReq);
      return DataSuccess<ResponseDto>(data: response.data);
    }catch(e){
      print(e);
      return DataException.getError<ResponseDto>(e);

    }
  }

  @override
  Future<DataState<ResponseDto>> updateSkills({required SkillsReq skillsReq}) async{
    try{
      final response=await profileService.updateSkills(skillsReq: skillsReq);
      return DataSuccess<ResponseDto>(data: response.data);
    }catch(e){
      print(e);
      return DataException.getError<ResponseDto>(e);

    }
  }
  //Lang
  @override
  Future<DataState<ResponseDto>> addLang({required LanguageReq languageReq})async {
    try{
      final response=await profileService.addLanguage(languageReq: languageReq);
      return DataSuccess<ResponseDto>(data: response.data);
    }catch(e){
      print(e);
      return DataException.getError<ResponseDto>(e);

    }
  }

  @override
  Future<DataState<ResponseDto>> updateLang({required LanguageReq languageReq, required int id})async {
    try{
      final response=await profileService.updateLang(languageReq: languageReq, id: id);
      return DataSuccess<ResponseDto>(data: response.data);
    }catch(e){
      print(e);
      return DataException.getError<ResponseDto>(e);

    }
  }

  @override
  Future<DataState<ResponseDto>> deleteLang({required int id})async {
    try{
      final response=await profileService.deleteLang( id: id);
      return DataSuccess<ResponseDto>(data: response.data);
    }catch(e){
      print(e);
      return DataException.getError<ResponseDto>(e);

    }
  }
  /*Exp*/

  @override
  Future<DataState<ResponseDto>> addExp({required ExpReq expReq})async {
    try{
      final response=await profileService.addExp(expReq: expReq);
      return DataSuccess<ResponseDto>(data: response.data);
    }catch(e){
      print(e);
      return DataException.getError<ResponseDto>(e);

    }
  }

  @override
  Future<DataState<ResponseDto>> delExp({required int id})async {
    try{
      final response=await profileService.deleteExp(id: id);
      return DataSuccess<ResponseDto>(data: response.data);
    }catch(e){
      print(e);
      return DataException.getError<ResponseDto>(e);

    }
  }

  @override
  Future<DataState<ResponseDto>> updateExp({required ExpReq expReq, required int id})async {
    try{
      final response=await profileService.updateExp(id: id, expReq: expReq );
      return DataSuccess<ResponseDto>(data: response.data);
    }catch(e){
      print(e);
      return DataException.getError<ResponseDto>(e);

    }
  }

  @override
  Future<DataState<ResponseDto>> addEdu({required EduReq eduReq})async {
    try{
      final response=await profileService.addEdu(eduReq: eduReq);
      return DataSuccess<ResponseDto>(data: response.data);
    }catch(e){
      print(e);
      return DataException.getError<ResponseDto>(e);

    }
  }

  @override
  Future<DataState<ResponseDto>> delEdu({required int id})async {
    try{
      final response=await profileService.deleteEdu(id: id);
      return DataSuccess<ResponseDto>(data: response.data);
    }catch(e){
      print(e);
      return DataException.getError<ResponseDto>(e);

    }
  }

  @override
  Future<DataState<ResponseDto>> updateEdu({required EduReq eduReq, required int id})async {
    try{
      final response=await profileService.updateEdu(eduReq: eduReq, id: id);
      return DataSuccess<ResponseDto>(data: response.data);

    }catch(e){
      print(e);
      return DataException.getError<ResponseDto>(e);

    }
  }

  @override
  Future<DataState<ResponseDto>> addAward({required AwardReq awardReq})async {
    try{
      final response=await profileService.addAward(awardReq: awardReq, );
      return DataSuccess<ResponseDto>(data: response.data);

    }catch(e){
      print(e);
      return DataException.getError<ResponseDto>(e);

    }
  }

  @override
  Future<DataState<ResponseDto>> delAward({required int id})async {
    try{
      final response=await profileService.deleteAward( id: id);
      return DataSuccess<ResponseDto>(data: response.data);

    }catch(e){
      print(e);
      return DataException.getError<ResponseDto>(e);}
  }

  @override
  Future<DataState<ResponseDto>> updateAward({required AwardReq awardReq, required int id})async {
    try{
      final response=await profileService.updateAward(  id: id, awardReq: awardReq);
      return DataSuccess<ResponseDto>(data: response.data);

    }catch(e){
      print(e);
      return DataException.getError<ResponseDto>(e);

    }
  }


}