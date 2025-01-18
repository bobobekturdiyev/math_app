import 'package:json_annotation/json_annotation.dart';
import 'package:math_app/features/home/data/model/course_details/course_details_dto.dart';
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
        case CourseDetailsDto:
          return CourseDetailsDto.fromJson(json) as T;
      }
      return DataResponse<T>.fromJson(json) as T;
    }
    return json as T;
  }

  @override
  Object? toJson(T object) => object;
}
