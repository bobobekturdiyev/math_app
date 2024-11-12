part of 'plan_bloc.dart';

@immutable
abstract class PlanEvent extends Equatable {}

class GetAllPlan extends PlanEvent{
  @override
  List<Object?> get props => [];


}


class PayFromBalance extends PlanEvent{
  @override
  List<Object?> get props => [];


}
