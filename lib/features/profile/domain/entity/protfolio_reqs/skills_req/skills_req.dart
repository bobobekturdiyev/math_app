

import 'package:json_annotation/json_annotation.dart';


part 'skills_req.g.dart';

@JsonSerializable()
class SkillsReq{
  final List<int> tags;



  factory SkillsReq.fromJson(Map<String, dynamic> json) =>
      _$SkillsReqFromJson(json);

  SkillsReq({required this.tags});

  Map<String, dynamic> toJson() => _$SkillsReqToJson(this);


}