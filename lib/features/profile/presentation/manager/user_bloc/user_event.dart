part of 'user_bloc.dart';

@immutable
abstract class UserEvent extends Equatable {}

class GetUserData extends UserEvent {

  @override
  List<Object?> get props =>[];

}
class LogOut extends UserEvent {

  @override
  List<Object?> get props =>[];

}
