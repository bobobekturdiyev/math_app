
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:math_app/core/shared_entities/course_details_entity.dart';
import "package:meta/meta.dart";
import 'package:math_app/core/resources/data_state.dart';
import 'package:math_app/features/home/domain/repositories/home_repo.dart';

part 'course_details_screen_event.dart';
part 'course_details_screen_state.dart';

class CourseDetailsScreenBloc extends Bloc<CourseDetailsScreenEvent, CourseDetailsScreenState> {
  final HomeRepo homeRepo;
  CourseDetailsScreenBloc({required this.homeRepo}) : super(CourseDetailsScreenInitial()) {
    on<GetCourseDetails>((event, emit)async {
      emit(CourseDetailsLoading());

      final response=await homeRepo.getCourseDetails(slug: event.slug);
      if(response is DataSuccess){
        emit(CourseDetailsLoaded(courseDetailsEntity: response.data!));
      }else{
        emit(CourseDetailsLoading());
      }



    });

  }
}
