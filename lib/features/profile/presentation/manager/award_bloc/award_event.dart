part of 'award_bloc.dart';

@immutable
abstract class AwardEvent extends Equatable{}



class AddAward extends AwardEvent{
  final AwardReq awardReq;


  AddAward( {required this.awardReq});

  @override
  List<Object?> get props => [];

}


class EditAward extends AwardEvent{
  final AwardReq awardReq;
  final int id;


  EditAward( {required this.id,required this.awardReq});

  @override
  List<Object?> get props => [];

}
