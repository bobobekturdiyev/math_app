

import 'package:json_annotation/json_annotation.dart';


part 'exp_req.g.dart';

@JsonSerializable()
class ExpReq{

  final String title;
  @JsonKey(name: 'from_date')
  final String fromDate;
  @JsonKey(name: 'to_date')
  final String toDate;
  @JsonKey(name: 'company_name')
  final String compName;
  final String description;





  factory ExpReq.fromJson(Map<String, dynamic> json) =>
      _$ExpReqFromJson(json);

  ExpReq(
      {required this.title,
      required this.fromDate,
      required this.toDate,
      required this.compName,
      required this.description});

  Map<String, dynamic> toJson() => _$ExpReqToJson(this);


}