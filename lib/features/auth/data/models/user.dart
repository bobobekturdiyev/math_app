import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final int? id;
  final String? name;
  @JsonKey(name: 'surname')
  final String? surname;
  final String? phone;

  const User({
    this.id,
    this.name,
    this.surname,
    this.phone,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
