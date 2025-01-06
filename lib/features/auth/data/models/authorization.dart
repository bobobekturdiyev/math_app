import 'package:json_annotation/json_annotation.dart';

part 'authorization.g.dart';

@JsonSerializable()
class Authorization {
  final String token;

  const Authorization({
    required this.token,
  });

  factory Authorization.fromJson(Map<String, dynamic> json) =>
      _$AuthorizationFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorizationToJson(this);
}
