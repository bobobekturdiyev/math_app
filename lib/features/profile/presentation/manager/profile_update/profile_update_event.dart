part of 'profile_update_bloc.dart';

sealed class ProfileUpdateEvent extends Equatable {
  const ProfileUpdateEvent();
}

class SendProfileUpdateCredentialsEvent extends ProfileUpdateEvent {
  final ProfileUpdateRequest profileUpdateRequest;

  const SendProfileUpdateCredentialsEvent({
    required this.profileUpdateRequest,
  });

  @override
  List<Object?> get props => [profileUpdateRequest];
}
