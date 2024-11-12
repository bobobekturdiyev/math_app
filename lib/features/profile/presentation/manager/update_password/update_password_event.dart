part of 'update_password_bloc.dart';

@immutable
abstract class UpdatePasswordEvent extends Equatable {}
class UpdatePassword extends UpdatePasswordEvent{
  final String password;
  final String confirmPassword;

  UpdatePassword({required this.password, required this.confirmPassword});
  @override
  List<Object?> get props => [];
}