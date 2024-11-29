import 'package:json_annotation/json_annotation.dart';
import 'package:math_app/core/shared/data/shared_models/course_model/course_dto.dart';
import 'package:math_app/features/show_lesson/data/model/show_lesson_dto.dart';

import '../../features/profile/data/model/all_info_dto/all_info_dto.dart';

part 'data_response.g.dart';

@JsonSerializable()
class DataResponse<T> {
  @JsonKey(name: "data")
  @_Converter()
  final T data;

  const DataResponse({
    required this.data,
  });

  factory DataResponse.fromJson(Map<String, dynamic> json) =>
      _$DataResponseFromJson<T>(json);

  Map<String, dynamic> toJson() => _$DataResponseToJson(this);
}

class _Converter<T> implements JsonConverter<T, Object?> {
  const _Converter();

  @override
  T fromJson(Object? json) {
    if (json is Map<String, dynamic>) {
      switch (T) {
        case CourseDto:
          return CourseDto.fromJson(json) as T;
          case ShowLessonDto:
          return ShowLessonDto.fromJson(json) as T;
          case AllInfoDto:
          return AllInfoDto.fromJson(json) as T;

      }
      return DataResponse<T>.fromJson(json) as T;
    }
    return json as T;
  }

  @override
  Object? toJson(T object) => object;
}
