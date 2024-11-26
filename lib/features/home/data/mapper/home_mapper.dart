import 'package:math_app/features/home/data/model/all_course/all_course_dto.dart';
import 'package:math_app/features/home/data/model/course_details/course_details_dto.dart';
import 'package:math_app/features/home/data/model/course_module/course_module_dto.dart';
import 'package:math_app/features/home/data/model/lesson/lesson_dto.dart';
import 'package:math_app/features/home/domain/entity/all_course_entity.dart';
import 'package:math_app/features/home/domain/entity/course_details_entity.dart';
import 'package:math_app/features/home/domain/entity/lesson_entity.dart';
import 'package:math_app/features/home/domain/entity/module_entity.dart';

class HomeMapper {
  List<AllCourseEntity> getAllCourseListDtoToEntityList(
          List<AllCourseDto> data) =>
      List.generate(
        data.length,
        (i) => getAllCourseDtoToEntity(data[i]),
      );

  AllCourseEntity getAllCourseDtoToEntity(AllCourseDto dto) => AllCourseEntity(
        id: dto.id,
        price: dto.price,
        name: dto.name,
        slug: dto.slug,
        photo: dto.photo,
        excerpt: dto.excerpt,
        discountPrice: dto.discountedPrice,
      );

  CourseDetailsEntity getCourseDetailsDtoToEntity(CourseDetailsDto dto) =>
      CourseDetailsEntity(
        id: dto.id,
        name: dto.name,
        author: dto.author,
        slug: dto.slug,
        isSold: dto.isSold,
        modules: getModuleDtoListToEntityList(dto.modules),
        price: dto.price,
        description: dto.description,
        discountPrice: dto.discountedPrice.toDouble(),
      );

  ModuleEntity getModuleDtoToEntity(CourseModuleDto dto) => ModuleEntity(
        id: dto.id,
        name: dto.name,
        position: dto.position,
        lessons: getLessonsDtoListToEntityList(dto.lessons),
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
        videoUrl: dto.videoUrl,
      );

  List<LessonEntity> getLessonsDtoListToEntityList(List<LessonDto> data) =>
      List.generate(
        data.length,
        (i) => getLessonDtoToEntity(data[i]),
      );
}
