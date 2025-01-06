import 'package:math_app/core/error/exception_handler.dart';
import 'package:math_app/core/resources/data_state.dart';
import 'package:math_app/features/my_courses/data/model/my_course_dto/my_course_dto.dart';
import 'package:math_app/features/my_courses/domain/repositories/my_course_repo.dart';

import '../data_source/my_course_service.dart';

class ImplMyCourseRepo extends MyCourseRepo{
  final MyCourseService myCourseService;

  ImplMyCourseRepo({required this.myCourseService});

  @override
  Future<DataState<List<MyCourseDto>>> getMyCourses(String filter)async {
    try{
   final response=   await myCourseService.getMyCourse(filter:filter );
   return DataSuccess(data: response.data);

    }catch(e){
      return DataException.getError<List<MyCourseDto>>(e);
    }


  }
}