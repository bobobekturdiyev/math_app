import 'package:math_app/features/home/data/model/all_course/all_course_dto.dart';

import 'package:math_app/features/home/domain/entity/all_course_entity.dart';


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


}
