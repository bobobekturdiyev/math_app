
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:math_app/core/resources/data_state.dart';

import '../../../data/model/plan_dto/plan_dto.dart';
import '../../../domain/repositories/profile_repo.dart';

part 'plan_event.dart';
part 'plan_state.dart';

class PlanBloc extends Bloc<PlanEvent, PlanState> {
  final ProfileRepo profileRepo;
  PlanBloc({required this.profileRepo}) : super( PlanInitial()) {
    on<GetAllPlan>((event, emit)async {
      emit(PlanLoading());
      final response=await profileRepo.getAllPlan();


      if(response is DataSuccess){


        emit(PlanLoaded(plans: response.data??[]));
      }else if(401==401){
        emit(PlanUnauthorized());
      }
      else{
        emit( PlanError());
      }
    });
    add(GetAllPlan());
  }
}
