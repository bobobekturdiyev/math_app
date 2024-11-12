part of 'update_password_bloc.dart';

@immutable
abstract class UpdatePasswordState extends Equatable {}

class UpdatePasswordInitial extends UpdatePasswordState {
  final String? error;
  final StateStatus status;
  final Map<String, String?>? errorData;

  UpdatePasswordInitial({ this.error,  this.status=StateStatus.normal,  this.errorData});
  @override
  List<Object?> get props => [error,errorData,status];
}
