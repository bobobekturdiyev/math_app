// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'push_token.g.dart';

@JsonSerializable()
class PushtokenEntities {
  @JsonKey(name: 'app_token')
  String token;
  
  PushtokenEntities({ required this.token});

  factory PushtokenEntities.fromJson(Map<String, dynamic> json) =>
      _$PushtokenEntitiesFromJson(json);

  Map<String, dynamic> toJson() => _$PushtokenEntitiesToJson(this);
}
