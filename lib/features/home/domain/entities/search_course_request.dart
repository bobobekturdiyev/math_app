import 'package:json_annotation/json_annotation.dart';

part 'search_course_request.g.dart';

@JsonSerializable()
class SearchCourseRequest{
  final String query;

  SearchCourseRequest({
    required this.query,
});

  factory SearchCourseRequest.fromJson(Map<String, dynamic> json) =>
      _$SearchCourseRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SearchCourseRequestToJson(this);

}