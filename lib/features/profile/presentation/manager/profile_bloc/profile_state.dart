part of 'profile_bloc.dart';
enum UserImageState{normal,loading,loaded}
@immutable
class ProfileState extends Equatable {
  final StateStatus stateStatus;
  final UserImageState userImageState;
  final String? error;
  final User? user;


  const ProfileState({
    this.stateStatus = StateStatus.normal,
    this.userImageState = UserImageState.normal,
    this.user,
    this.error
  });

  ProfileState copyWith({
    StateStatus? stateStatus,
    UserImageState? userImageState,
    User? user,
    String? error,
  }) =>
      ProfileState(
        stateStatus: stateStatus ?? this.stateStatus,
        userImageState: userImageState ?? this.userImageState,
        user: user ?? this.user,
        error: error ?? this.error,
      );

  @override
  List<Object?> get props => [stateStatus,error,user,userImageState];
}
