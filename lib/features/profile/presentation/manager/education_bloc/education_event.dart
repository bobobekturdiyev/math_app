part of 'education_bloc.dart';

@immutable
abstract class EducationEvent extends Equatable {}


class AddEdu extends EducationEvent{
  final EduReq eduReq;


  AddEdu( {required this.eduReq});

  @override
  List<Object?> get props => [];

}


class EditEdu extends EducationEvent{
  final EduReq eduReq;
  final int id;


  EditEdu( {required this.id,required this.eduReq});

  @override
  List<Object?> get props => [];

}