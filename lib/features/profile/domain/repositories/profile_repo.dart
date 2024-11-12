
import 'package:math_app/features/profile/data/model/all_info_dto/skills_dto/skills_dto.dart';
import 'package:math_app/features/profile/data/model/pay_dto/pay_dto.dart';
import 'package:math_app/features/profile/data/model/plan_dto/plan_dto.dart';
import 'package:math_app/features/profile/domain/entity/card_req/card_pay_req.dart';
import 'package:math_app/features/profile/domain/entity/code_req/code_req.dart';
import 'package:math_app/features/profile/domain/entity/pay_request/pay_request.dart';
import 'package:math_app/features/profile/domain/entity/protfolio_reqs/about_req/about_req.dart';
import 'package:math_app/features/profile/domain/entity/protfolio_reqs/edu_req/edu_req.dart';
import 'package:math_app/features/profile/domain/entity/protfolio_reqs/exp_req/exp_req.dart';
import 'package:math_app/features/profile/domain/entity/protfolio_reqs/language_req/language_req.dart';
import 'package:math_app/features/profile/domain/entity/token_req/token_req.dart';
import 'package:math_app/features/profile/domain/entity/update_password/update_password_req.dart';

import '../../../../core/resources/data_state.dart';
import '../../data/model/all_info_dto/all_info_dto.dart';
import '../../data/model/balance_history/balance_history.dart';
import '../../data/model/payme_dto/create_card_dto.dart';
import '../../data/model/response_dto.dart';
import '../../data/model/update_password_dto/update_password_dto.dart';
import '../../data/model/verify_code_dto/verify_code_dto.dart';
import '../entity/protfolio_reqs/award_req/award_req.dart';
import '../entity/protfolio_reqs/skills_req/skills_req.dart';

abstract class ProfileRepo {
  Future<DataState<List<PlanDto>>> getAllPlan();
  Future<DataState<AllInfoDto>> getUserData();
  // Future<DataState<File>> getPortfolio();
  Future<DataState<List<BalanceHistoryDto>>> getBalanceHistories();
  Future<DataState<List<SkillsDto>>> getSkills({required String text});
  Future<DataState<PayDto>> payFromBalance({required PayRequest payRequest});
  Future<DataState<ResponseDto>> addSkills({required SkillsReq skillsReq});
  Future<DataState<ResponseDto>> updateSkills({required SkillsReq skillsReq});
  Future<DataState<CardCreateDto>> payFromCard({required CardPayReq cardPayReq});
  Future<DataState<VerifyCodeDto>> tokenVerify({required TokenReq tokenReq});
  Future<DataState<CardCreateDto>> codeVerify({required CodeReq codeReq});
  Future<DataState<UpdatePasswordDto>> updatePassword({required UpdatePasswordReq updatePasswordReq});
  Future<DataState<ResponseDto>> updateAbout({required AboutReq req });
  // Lang
  Future<DataState<ResponseDto>> addLang({required LanguageReq languageReq });
  Future<DataState<ResponseDto>> updateLang({required LanguageReq languageReq, required int id});
  Future<DataState<ResponseDto>> deleteLang({ required int id});
  //Lang
  //---------
  Future<DataState<ResponseDto>> addExp({required ExpReq expReq });
  Future<DataState<ResponseDto>> updateExp({required ExpReq expReq ,required int id});
  Future<DataState<ResponseDto>> delExp({required int id });
  //------Experience
  //------Education

  Future<DataState<ResponseDto>> addEdu({required EduReq eduReq });
  Future<DataState<ResponseDto>> updateEdu({required EduReq eduReq ,required int id});
  Future<DataState<ResponseDto>> delEdu({required int id });

  //-----award
  Future<DataState<ResponseDto>> addAward({required AwardReq awardReq });
  Future<DataState<ResponseDto>> updateAward({required AwardReq awardReq ,required int id});
  Future<DataState<ResponseDto>> delAward({required int id });



  Future<DataState> logout();
}