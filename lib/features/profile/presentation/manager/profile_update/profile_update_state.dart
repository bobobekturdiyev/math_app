part of 'profile_update_bloc.dart';

sealed class ProfileUpdateState extends Equatable {
  const ProfileUpdateState();
}

final class ProfileUpdateInitial extends ProfileUpdateState {
  @override
  List<Object> get props => [];
}

final class ProfileUpdateLoading extends ProfileUpdateState {
  @override
  List<Object> get props => [];
}

final class ProfileUpdateSuccess extends ProfileUpdateState {
  @override
  List<Object> get props => [];
}

final class ProfileUpdateValidationError extends ProfileUpdateState {
  final Map<String, String> error;

  const ProfileUpdateValidationError({
    required this.error,
  });

  @override
  List<Object> get props => [error];
}

final class ProfileUpdateError extends ProfileUpdateState {
  final String message;

  const ProfileUpdateError({required this.message});

  @override
  List<Object> get props => [message];
}
