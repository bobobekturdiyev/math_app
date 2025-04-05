import 'package:math_app/core/resources/data_state.dart';
import 'package:math_app/features/main/data/models/app_dto.dart';

abstract class AppRepo {
  Future<DataState<AppDto>> getMain();
}
