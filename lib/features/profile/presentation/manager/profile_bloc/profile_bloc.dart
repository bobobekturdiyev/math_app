
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:math_app/core/resources/data_state.dart';
import 'package:math_app/core/resources/state_status.dart';
import 'package:math_app/features/profile/domain/entity/protfolio_reqs/about_req/about_req.dart';
import 'package:math_app/features/profile/domain/entity/protfolio_reqs/language_req/language_req.dart';
import 'package:math_app/features/profile/domain/entity/protfolio_reqs/skills_req/skills_req.dart';
import 'package:math_app/features/profile/presentation/manager/user_bloc/user_bloc.dart';

import '../../../data/model/all_info_dto/skills_dto/skills_dto.dart';
import '../../../domain/repositories/profile_repo.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepo profileRepo;
  ProfileBloc({required this.profileRepo}) : super(ProfileInitial()) {
    on<AboutAdd>((event, emit) async{
    final response=await profileRepo.updateAbout(req: AboutReq(about: event.about));
    if(response is DataSuccess){
      emit(AboutState(status: StateStatus.success));
    }else{
        emit(AboutState(
            status: StateStatus.error,
            error: response.errorMessage,));
      }

    });
    on<SkillsAdd>((event, emit) async{
      emit(SkillsState(status: StateStatus.normal));
      if(event.status==StateStatus.loading){
        final response=await profileRepo.getSkills(text: event.text??'' );
        if(response is DataSuccess){
          emit(SkillsState(status: StateStatus.loaded,skills: response.data??[]));
        }else{
          emit(SkillsState(
              status: StateStatus.error,
              error: response.errorMessage ??
                  "error" ??
                  "Nimadir xato bo'ldi"));
      }
      }
      if(event.status==StateStatus.loaded){
        final respose=await profileRepo.updateSkills(skillsReq: SkillsReq(tags: event.tags));
        if(respose is DataSuccess){
          emit(SkillsState(status: StateStatus.success));
        }else{
          emit(SkillsState(status: StateStatus.error,error: respose.data?.message));

        }
      }


    });

    on<LanguageAdd>((event, emit) async{
      String level= levelFunc(event.level);

      final response = await profileRepo.addLang(
          languageReq: LanguageReq(lang: event.lang,level:level ));
      if(response is DataSuccess){
        emit(LangState(status: StateStatus.success));
      }else{
        emit(LangState(
            status: StateStatus.error,
            error: response.errorMessage,),);
      }

    });

    on<UpdateLang>((event, emit) async{
      String level= levelFunc(event.level);


      final response = await profileRepo.updateLang(
          languageReq: LanguageReq(lang: event.lang,level:level ), id:event.id );
      if(response is DataSuccess){
        print("sccessssss");
        emit(LangState(status: StateStatus.success));
      }else{
        emit(LangState(
            status: StateStatus.error,
            error: response.errorMessage ??
                "error" ??
                "Nimadir xato bo'ldi"));
      }

    });




  }

 String levelFunc(int level){
    if(level==0){
      return 'Beginner';
    }else if(level==1){
      return "Intermediate";
    }else if(level==2){
      return 'Advanced';
    }else{
      return '';
    }
  }
}
