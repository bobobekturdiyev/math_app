part of 'plan_bloc.dart';

@immutable
 abstract class PlanState extends Equatable {



}

class PlanInitial extends PlanState{

  @override
  List<Object?> get props => [];

}
class PlanLoading extends PlanState{

  @override
  List<Object?> get props => [];

}

class PlanLoaded extends PlanState{
  final List<PlanDto> plans;

  PlanLoaded({required this.plans});
  @override
  List<Object?> get props => [];

}

class PlanError extends PlanState{

  @override
  List<Object?> get props => [];

}

class PlanUnauthorized extends PlanState{

  @override
  List<Object?> get props => [];

}
