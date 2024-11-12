part of 'education_bloc.dart';

@immutable
abstract class EducationState extends Equatable {}

class EducationInitial extends EducationState {
  @override
  List<Object?> get props => throw [];
}



class EduState extends EducationState {
  final StateStatus status;
  final Map<String,String?>? errorData;
  EduState({ this.status=StateStatus.normal, this.errorData, });
  @override
  List<Object?> get props => [];
}

class EduSuccess extends EducationState {


  @override
  List<Object?> get props => [];
}
