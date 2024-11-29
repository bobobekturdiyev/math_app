import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:math_app/core/shared/domain/shared_entities/course_details_entity.dart';
import 'package:meta/meta.dart';
import 'package:math_app/core/resources/data_state.dart';
import 'package:math_app/features/show_lesson/domain/repositories/show_lesson_repo.dart';

part 'lesson_show_event.dart';
part 'lesson_show_state.dart';

class LessonShowBloc extends Bloc<LessonShowEvent, LessonShowState> {
  final ShowLessonRepo showLessonRepo;

  LessonShowBloc({required this.showLessonRepo}) : super(LessonShowInitial()) {
    on<GetCourseBySlug>((event, emit) async{
      emit(LessonShowInitial());
      final response = await showLessonRepo.getLesson(slug: event.lessonSlug);
      if(response is DataSuccess){
        emit(LessonShowLoaded(courseEntity: response.data!, ),);
      }else{
        emit(LessonShowError());
        print('error');

      }

    });
    on<LessonMarkAsWatched>((event, emit) async{
      final response = await showLessonRepo.lessonMarkAsWatch(lessonId: event.lessonId);
      // if(response is DataSuccess){
      //   // emit(LessonShowLoaded(courseEntity: response.data!, ),);
      // }else{
      //   emit(LessonShowError());
      //   print('error');
      //
      // }

    });
  }
}