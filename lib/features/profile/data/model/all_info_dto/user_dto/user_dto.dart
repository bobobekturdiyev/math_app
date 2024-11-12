

import 'package:json_annotation/json_annotation.dart';

part 'user_dto.g.dart';
@JsonSerializable()
class UserDto{
  final int id;
  final String name;
  final String surname;
  final int balance;
  final String? email;
  final String phone;
  final String? about;
  @JsonKey(name: "student_id")
  final String studentId;



  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserDtoToJson(this);

  const UserDto({
    required this.id,
    required this.name,
    required this.surname,
    required this.balance,
    required this.phone,
    this.about,
     this.email,
    required this.studentId,
  });
}