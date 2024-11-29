part of 'user_bloc.dart';

@immutable
 class UserState extends Equatable {
  final   StateStatus stateStatus;
  final User? user;
  final String? error;


  UserState({ this.stateStatus=StateStatus.normal,
  this.user,
  this.error,
  });

  UserState copyWith({
    StateStatus? stateStatus ,
    User? user,
    String? error
})=>UserState(
    stateStatus:stateStatus??this.stateStatus,
    user: user??this.user,
    error: error??this.error
  );

  @override
  List<Object?> get props => [stateStatus,error,user];
}

