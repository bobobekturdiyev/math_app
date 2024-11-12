import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:math_app/features/profile/domain/entity/protfolio_reqs/award_req/award_req.dart';

import '../../../../../core/resources/data_state.dart';
import '../../../../../core/resources/state_status.dart';
import '../../../domain/repositories/profile_repo.dart';

part 'award_event.dart';
part 'award_state.dart';

class AwardBloc extends Bloc<AwardEvent, AwardState> {
  final ProfileRepo profileRepo;
  bool hasError = false;
  Map<String, String?> edu = {
    'university': null,
    'website': null,
    'fromDate': null,
    'toDate': null,
    'error': null,
  };
  AwardBloc({required this.profileRepo}) : super(const AwardState()) {
    on<AddAward>((event, emit) async {
      validator(event);

      if (!hasError) {
        emit(AwardState(status: StateStatus.loading));
        final result = await profileRepo.addAward(awardReq: event.awardReq);
        if (result is DataSuccess) {
          if (result.data?.code == 200) {
            emit(AwardSuccess());
          }
          else {
            emit(AwardState(
              status: StateStatus.error,
            ));
          }
        }
        else {
          emit(const AwardState(status: StateStatus.error));
        }
      } else {
        emit(AwardState(status: StateStatus.error, errorData: edu));
      }
    });
    on<EditAward>((event, emit) async {
      validator(event);
      if (!hasError) {
        emit(const AwardState(status: StateStatus.loading));
        final result =
        await profileRepo.updateAward(awardReq: event.awardReq, id: event.id);
        if (result is DataSuccess) {
          if (result.data?.code == 200) {
            emit(AwardSuccess());
          } else {
            emit(const AwardState(
              status: StateStatus.error,
            ));
          }
        } else {
          emit(const AwardState(status: StateStatus.error));
        }
      } else {
        emit(AwardState(status: StateStatus.error, errorData: edu));
      }
    });
  }
  validator(event){
    if (event.awardReq.title.isEmpty) {
      hasError = true;
      edu['university'] = "University nomini to'ldiring";
    } if (event.awardReq.description.isEmpty) {
      hasError = true;
      edu['fromDate'] = "Boshlangich vaqtni to'ldiring";
      edu['toDate'] = "Tugagan vaqtni to'ldiring";
    } if (event.awardReq.link.isEmpty) {
      hasError = true;
      edu['website'] = "Weebsite to'ldiring";
    }
  }

}
