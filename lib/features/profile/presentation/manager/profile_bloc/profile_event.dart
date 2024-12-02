part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent extends Equatable {}



class UpdateProfileIMage extends ProfileEvent{
  final File image;

  UpdateProfileIMage({required this.image});

  @override
  List<Object?> get props => [image];

}
class UpdateUserInfo extends ProfileEvent{
  final String email;
  final String address;
  final String birthday;

  UpdateUserInfo({required this.email, required this.address, required this.birthday});


  @override
  List<Object?> get props => [email,address,birthday];

}


