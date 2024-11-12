part of 'award_bloc.dart';

@immutable
 class AwardState extends Equatable {
  final StateStatus status;
  final Map<String,String?>? errorData;
  const AwardState({ this.status=StateStatus.normal, this.errorData, });
  @override
  List<Object?> get props => [];
}



class AwardSuccess extends AwardState {


  @override
  List<Object?> get props => [];
}