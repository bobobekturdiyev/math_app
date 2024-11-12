import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:math_app/core/resources/data_state.dart';
import 'package:math_app/core/resources/state_status.dart';
import 'package:math_app/features/profile/domain/entity/protfolio_reqs/exp_req/exp_req.dart';

import '../../../../../core/util/validator.dart';
import '../../../domain/repositories/profile_repo.dart';

part 'experience_event.dart';

part 'experience_state.dart';

class ExperienceBloc extends Bloc<ExperienceEvent, ExperienceState> {
  final ProfileRepo profileRepo;

  ExperienceBloc({required this.profileRepo}) : super(ExpState()) {

    bool hasError = false;
    Map<String, String?> exp = {
      'title': null,
      'company': null,
      'desc': null,
      'error': null,
    };
    on<AddExp>((event, emit) async {


      if (event.expReq.title.isEmpty) {
        hasError = true;
        exp['title'] = "Titleni to'ldiring";
      } if (event.expReq.compName.isEmpty) {
        hasError = true;
        exp['company'] = "Companiya nomini to'ldiring";
      } if (event.expReq.fromDate.isEmpty||event.expReq.toDate.isEmpty) {
        hasError = true;
        exp['fromDate'] = "Boshlangich vaqtni to'ldiring";
        exp['toDate'] = "Tugagan vaqtni to'ldiring";
      } if (event.expReq.description.isEmpty) {
        hasError = true;
        exp['description'] = "Descriptionni to'ldiring";
      }

     if(!hasError){
       emit(ExpState(status: StateStatus.loading));
       final result = await profileRepo.addExp(expReq: event.expReq);
       if (result is DataSuccess) {
         if (result.data?.code == 200) {
           emit(ExpSuccess());
         } else {
           emit(ExpState(status: StateStatus.error,  ));
         }
       } else {
         emit(ExpState(status: StateStatus.error));
       }
     }else{
       emit(ExpState(status: StateStatus.error,errorData: exp));


     }
    });
    on<EditExp>((event, emit) async {

      if (event.expReq.title.isEmpty) {
        hasError = true;
        exp['title'] = "Titleni to'ldiring";
      } if (event.expReq.compName.isEmpty) {
        hasError = true;
        exp['company'] = "Companiya nomini to'ldiring";
      } if (event.expReq.fromDate.isEmpty||event.expReq.toDate.isEmpty) {
        hasError = true;
        exp['fromDate'] = "Boshlangich vaqtni to'ldiring";
        exp['toDate'] = "Tugagan vaqtni to'ldiring";
      } if (event.expReq.description.isEmpty) {
        hasError = true;
        exp['description'] = "Descriptionni to'ldiring";
      }

      if(!hasError){
        emit(ExpState(status: StateStatus.loading));
        final result = await profileRepo.updateExp(expReq: event.expReq, id: event.id);
        if (result is DataSuccess) {
          if (result.data?.code == 200) {
            emit(ExpSuccess());
          } else {
            emit(ExpState(status: StateStatus.error,  ));
          }
        } else {
          emit(ExpState(status: StateStatus.error));
        }
      }else{
        emit(ExpState(status: StateStatus.error,errorData: exp));


      }
    });
  }
}
