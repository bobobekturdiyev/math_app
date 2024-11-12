part of 'profile_bloc.dart';

@immutable
abstract class ProfileState extends Equatable {}



class ProfileInitial extends ProfileState {
  @override
  List<Object?> get props => [];
}


class MyIncomeState extends ProfileState {
  @override
  List<Object?> get props => [];
}
class AboutState extends ProfileState {
  final StateStatus status;
  final String? error;


  AboutState({ this.status=StateStatus.normal,this.error, });
  @override
  List<Object?> get props => [status,error];
}

class LangState extends ProfileState {
  final StateStatus status;
  final String? error;


  LangState({ this.status=StateStatus.normal,this.error, });
  @override
  List<Object?> get props => [status,error];
}
class SkillsState extends ProfileState {
  final StateStatus status;
  final String? error;
  final List<SkillsDto> skills;

  SkillsState( { this.status=StateStatus.normal,  this.error, this.skills=const[]});
  @override
  List<Object?> get props => [status,error];
}

