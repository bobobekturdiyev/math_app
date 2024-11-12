import 'package:json_annotation/json_annotation.dart';
import 'package:math_app/features/home/data/model/lesson_by_course/lesson_by_course.dart';
import 'package:math_app/features/profile/data/model/all_info_dto/skills_dto/skills_dto.dart';

import '../../features/chat/data/models/user/chat/chat_user.dart';
import '../../features/chat/data/models/user/get_chat_manager/users_dto.dart';
import '../../features/home/data/model/all_course/all_course_dto.dart';
import '../../features/my_courses/data/model/my_course_dto/my_course_dto.dart';
import '../../features/profile/data/model/balance_history/balance_history.dart';
import '../../features/profile/data/model/plan_dto/plan_dto.dart';


part 'default_response.g.dart';

@JsonSerializable()
class DefaultResponse<T> {
  @JsonKey(name: "data")
  @_Converter()
  final List<T> data;

  const DefaultResponse({
    required this.data,
  });

  factory DefaultResponse.fromJson(Map<String, dynamic> json) =>
      _$DefaultResponseFromJson<T>(json);

  Map<String, dynamic> toJson() => _$DefaultResponseToJson(this);
}

class _Converter<T> implements JsonConverter<T, Object?> {
  const _Converter();

  /*/ SocialLinkDTO fromJson(json)

   */
  @override
  T fromJson(Object? json) {
    if (json is Map<String, dynamic>) {
      switch (T) {
        case AllCourseDto:
          return AllCourseDto.fromJson(json) as T;
          case LessonByCourseDto:
          return LessonByCourseDto.fromJson(json) as T;
          case PlanDto:
          return PlanDto.fromJson(json) as T;
          case UsersDto:
          return UsersDto.fromJson(json) as T;
          case ChatUserDto:
          return ChatUserDto.fromJson(json) as T;
          case MyCourseDto:
          return MyCourseDto.fromJson(json) as T;
          case BalanceHistoryDto:
          return BalanceHistoryDto.fromJson(json) as T;
          case SkillsDto:
          return SkillsDto.fromJson(json) as T;

      }
      return DefaultResponse<T>.fromJson(json) as T;
    }
    return json as T;
  }

  @override
  Object? toJson(T object) => object;
}
