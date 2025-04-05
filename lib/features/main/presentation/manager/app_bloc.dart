import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:math_app/core/di/locator.dart';
import 'package:math_app/core/resources/data_state.dart';
import 'package:math_app/features/main/data/models/app_dto.dart';
import 'package:math_app/features/main/domain/repository/app_repo.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppDto? appData;
  final AppRepo appRepo = locator<AppRepo>();

  AppBloc() : super(AppInitial()) {
    on<LoadAppData>((event, emit) async {
      emit(AppLoading());

      final result = await appRepo.getMain();

      if (result is DataSuccess && result.data != null) {
        emit(AppLoaded(appDto: result.data!));
      } else {
        emit(AppError(message: result.errorMessage ?? "?error_app_loaded"));
      }
    });
  }
}
