import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String? name;
  @JsonKey(name: 'last_name')
  final String? lastName;
  final String? phone;
  final String? image;

  const User({
    this.name,
    this.lastName,
    this.phone,
    this.image,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
