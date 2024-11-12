

import 'package:json_annotation/json_annotation.dart';


part 'award_req.g.dart';

@JsonSerializable()
class AwardReq{
final String title;
final String description;
final String? link;






  factory AwardReq.fromJson(Map<String, dynamic> json) =>
      _$AwardReqFromJson(json);

  AwardReq({required this.title, required this.description, required this.link});




  Map<String, dynamic> toJson() => _$AwardReqToJson(this);


}