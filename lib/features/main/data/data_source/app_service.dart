import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/network/urls.dart';
import '../models/app_dto.dart';

part 'app_service.g.dart';

@RestApi(baseUrl: Urls.baseURl)
abstract class AppService {
  factory AppService(Dio dio, {String baseUrl}) = _AppService;

  @GET("/main")
  Future<HttpResponse<AppDto>> getMain();
}
