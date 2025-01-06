


import 'package:math_app/core/shared/data/shared_models/course_model/course_dto.dart';
import 'package:math_app/core/shared/data/shared_models/course_module/course_module_dto.dart';
import 'package:math_app/core/shared/data/shared_models/lesson/lesson_dto.dart';
import 'package:math_app/core/shared/domain/shared_entities/course_details_entity.dart';
import 'package:math_app/core/shared/domain/shared_entities/lesson_entity.dart';
import 'package:math_app/core/shared/domain/shared_entities/module_entity.dart';

class SharedMapper{
  CourseDetailsEntity getCourseDetailsDtoToEntity(CourseDto dto) =>
      CourseDetailsEntity(
        id: dto.id,
        name: dto.name,
        author: dto.author,
        slug: dto.slug,
        isSold: dto.isSold,
        modules: getModuleDtoListToEntityList(dto.modules),
        price: dto.price??0,
        description: dto.description,
        discountPrice: dto.discountedPrice?.toDouble()??0,
      );

  ModuleEntity getModuleDtoToEntity(CourseModuleDto dto) => ModuleEntity(
    id: dto.id,
    name: dto.name,
    position: dto.position,
    lessons: getLessonsDtoListToEntityList(dto.lessons), quizId: dto.quiz?.id??0,
  );

  List<ModuleEntity> getModuleDtoListToEntityList(
      List<CourseModuleDto> data) =>
      List.generate(
        data.length,
            (i) => getModuleDtoToEntity(data[i]),
      );

  LessonEntity getLessonDtoToEntity(LessonDto dto) => LessonEntity(
    id: dto.id,
    title: dto.title,
    duration: dto.duration,
    hasAccess: dto.hasAccess,
    isWatched: dto.isWatched,
    videoUrl: dto.videoUrl??'',
  );

  List<LessonEntity> getLessonsDtoListToEntityList(List<LessonDto> data) =>
      List.generate(
        data.length,
            (i) => getLessonDtoToEntity(data[i]),
      );
}