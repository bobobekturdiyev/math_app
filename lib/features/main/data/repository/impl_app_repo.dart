import 'package:math_app/core/error/exception_handler.dart';
import 'package:math_app/core/resources/data_state.dart';
import 'package:math_app/features/main/data/data_source/app_service.dart';
import 'package:math_app/features/main/data/models/app_dto.dart';
import 'package:math_app/features/main/domain/repository/app_repo.dart';

class ImplAppRepo extends AppRepo {
  final AppService appService;

  ImplAppRepo({required this.appService});

  @override
  Future<DataState<AppDto>> getMain() async {
    try {
      final response = await appService.getMain();

      return DataSuccess<AppDto>(data: response.data);
    } catch (e) {
      return DataException.getError(e);
    }
  }
}
