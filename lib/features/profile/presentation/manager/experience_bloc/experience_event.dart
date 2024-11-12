part of 'experience_bloc.dart';

@immutable
abstract class ExperienceEvent extends Equatable {}

class AddExp extends ExperienceEvent{
  final ExpReq expReq;

  AddExp({required this.expReq});

  @override
  List<Object?> get props => [];

}class EditExp extends ExperienceEvent{
  final ExpReq expReq;
  final int id;


  EditExp( {required this.id,required this.expReq});

  @override
  List<Object?> get props => [];

}class DelExp extends ExperienceEvent{
  @override
  List<Object?> get props => [];

}