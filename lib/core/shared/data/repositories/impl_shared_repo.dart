import 'package:math_app/core/error/exception_handler.dart';
import 'package:math_app/core/resources/data_state.dart';
import 'package:math_app/core/shared/data/data_source/shared_service.dart';
import 'package:math_app/core/shared/data/shared_models/user_model/user.dart';
import 'package:math_app/core/shared/domain/repositories/shared_repo.dart';

class ImplSharedRepo extends SharedRepo{
  final SharedService sharedService;

  ImplSharedRepo({required this.sharedService});
  @override
  Future<DataState<User?>> getMe()async {
    try{
      final response=await sharedService.getMe();
      return DataSuccess<User?>(data: response.data);
    }catch(e){
      return DataException.getError<User?>(e);
    }
  }
}