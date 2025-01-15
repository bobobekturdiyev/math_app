import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:math_app/features/home/data/model/course_details/course_details_dto.dart';
import 'package:math_app/features/home/data/model/lesson_by_course/lesson_by_course.dart';
import 'package:meta/meta.dart';

part 'course_details_screen_event.dart';
part 'course_details_screen_state.dart';

class CourseDetailsScreenBloc
    extends Bloc<CourseDetailsScreenEvent, CourseDetailsScreenState> {
  CourseDetailsScreenBloc() : super(CourseDetailsScreenInitial()) {
    on<GetCourseDetails>((event, emit) async {
      emit(CourseDetailsLoading());

      // final response=await homeRepo.getCourseDetails(slug: event.slug);
      // if(response is DataSuccess){
      //   emit(CourseDetailsLoaded(courseDetailsDto: response.data!));
      // }else{
      //   emit(CourseDetailsLoading());
      // }
    });
  }
}
