import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:math_app/core/di/locator.dart';
import 'package:math_app/core/resources/data_state.dart';
import 'package:math_app/features/profile/presentation/manager/user_bloc/user_bloc.dart';

import '../../../../../core/resources/state_status.dart';
import '../../../domain/repositories/profile_repo.dart';

part 'portfolio_del_event.dart';
part 'portfolio_del_state.dart';

class PortfolioDelBloc extends Bloc<PortfolioDelEvent, PortfolioDelState> {
  final ProfileRepo profileRepo;
  PortfolioDelBloc({required this.profileRepo}) : super(PortfolioDelInitial()) {
    on<ExpDelete>((event, emit)async {
      emit(DelState(status: StateStatus.loading));
      final result=await profileRepo.delExp(id: event.id);
      resultFunc(result);
    });

    on<EduDelete>((event, emit)async {
      emit(DelState(status: StateStatus.loading));
      final result=await profileRepo.delEdu(id: event.id);
      resultFunc(result);

    });

    on<AwardDelete>((event, emit)async {
      emit(DelState(status: StateStatus.loading));
      final result=await profileRepo.delAward(id: event.id);
      resultFunc(result);

    });

    on<LangDelete>((event, emit)async {
      emit(DelState(status: StateStatus.loading));
      final result=await profileRepo.deleteLang(id: event.id);
      resultFunc(result);

    });

  }
  resultFunc(result){
    if(result is DataSuccess){
      if(result.data?.code==200){
         locator<GlobalKey<ScaffoldState>>().currentContext!.read<UserBloc>().add(GetUserData());

      }else{
        emit(DelState(status: StateStatus.error));
      }
    }else{
      emit(DelState(status: StateStatus.error));
    }}


}
