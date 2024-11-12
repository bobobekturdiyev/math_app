part of 'experience_bloc.dart';

@immutable
abstract class ExperienceState extends Equatable {}

class ExperienceInitial extends ExperienceState {
  @override
  List<Object?> get props => [];
}

class ExpState extends ExperienceState {
  final StateStatus status;
final Map<String,String?>? errorData;
  ExpState({ this.status=StateStatus.normal, this.errorData, });
  @override
  List<Object?> get props => [];
}

class ExpSuccess extends ExperienceState {


  @override
  List<Object?> get props => [];
}


