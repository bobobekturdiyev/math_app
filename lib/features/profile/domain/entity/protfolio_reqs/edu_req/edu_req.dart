

import 'package:json_annotation/json_annotation.dart';


part 'edu_req.g.dart';

@JsonSerializable()
class EduReq{
  @JsonKey(name: 'university_name')
  final String university;
  final String website;
  @JsonKey(name: 'from_date')
  final String fromDate;
  @JsonKey(name: 'to_date')
  final String toDate;






  factory EduReq.fromJson(Map<String, dynamic> json) =>
      _$EduReqFromJson(json);

  EduReq({required this.university, required this.website, required this.fromDate, required this.toDate});



  Map<String, dynamic> toJson() => _$EduReqToJson(this);


}