import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_app/features/home/domain/usecases/home_usecase.dart';

import '../../../../../core/resources/data_state.dart';
import 'home_screen_event.dart';
import 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  final HomeUseCases homeUseCases;

  HomeScreenBloc({required this.homeUseCases}) : super(HomeScreenInitial()) {
    on<GetAllCourse>((event, emit) async {
      emit(AllCourseLoading());

      final response = await homeUseCases.getAllCourse(filter: event.filter,search: event.searchQuery);
      if (response is DataSuccess) {
        emit(AllCourseLoaded(allCourse: response.data ?? []));
      } else {
        emit(
          AllCourseError(error: response.errorResponse?.message ?? "Error"),
        );
      }
    });
    add(GetAllCourse());
  }


}
