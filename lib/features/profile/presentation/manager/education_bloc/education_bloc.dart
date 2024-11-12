import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/resources/data_state.dart';
import '../../../../../core/resources/state_status.dart';
import '../../../domain/entity/protfolio_reqs/edu_req/edu_req.dart';
import '../../../domain/entity/protfolio_reqs/edu_req/edu_req.dart';
import '../../../domain/repositories/profile_repo.dart';

part 'education_event.dart';
part 'education_state.dart';

class EducationBloc extends Bloc<EducationEvent, EducationState> {
  final ProfileRepo profileRepo;
  bool hasError = false;
  Map<String, String?> edu = {
    'university': null,
    'website': null,
    'fromDate': null,
    'toDate': null,
    'error': null,
  };

  EducationBloc({required this.profileRepo}) : super(EduState()) {
    on<AddEdu>((event, emit) async {
      validator(event);

      if (!hasError) {
        emit(EduState(status: StateStatus.loading));
        final result = await profileRepo.addEdu(eduReq: event.eduReq);
        if (result is DataSuccess) {
          if (result.data?.code == 200) {
            emit(EduSuccess());
          } else {
            emit(EduState(
              status: StateStatus.error,
            ));
          }
        } else {
          emit(EduState(status: StateStatus.error));
        }
      } else {
        emit(EduState(status: StateStatus.error, errorData: edu));
      }
    });
    on<EditEdu>((event, emit) async {
      validator(event);
      if (!hasError) {
        emit(EduState(status: StateStatus.loading));
        final result =
            await profileRepo.updateEdu(eduReq: event.eduReq, id: event.id);
        if (result is DataSuccess) {
          if (result.data?.code == 200) {
            emit(EduSuccess());
          } else {
            emit(EduState(
              status: StateStatus.error,
            ));
          }
        } else {
          emit(EduState(status: StateStatus.error));
        }
      } else {
        emit(EduState(status: StateStatus.error, errorData: edu));
      }
    });
  }
  validator(event){
    if (event.eduReq.university.isEmpty) {
      hasError = true;
      edu['university'] = "University nomini to'ldiring";
    } if (event.eduReq.fromDate.isEmpty||event.eduReq.toDate.isEmpty) {
      hasError = true;
      edu['fromDate'] = "Boshlangich vaqtni to'ldiring";
      edu['toDate'] = "Tugagan vaqtni to'ldiring";
    } if (event.eduReq.website.isEmpty) {
      hasError = true;
      edu['website'] = "Weebsite to'ldiring";
    }
  }

}
