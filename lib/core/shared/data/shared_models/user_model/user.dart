import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';
@JsonSerializable()
class User {
  @JsonKey(name: 'first_name')
  final String? name;
  @JsonKey(name: 'last_name')
  final String? lastName;
  final String? phone;
  final String? email;
  final String? address;
  final String? birthday;
  final String? image;



  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  User({required this.name, required this.lastName, required this.phone, required this.email, required this.address, required this.birthday, required this.image});

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
