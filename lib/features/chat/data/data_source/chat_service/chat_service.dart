import 'package:dio/dio.dart';

import 'package:retrofit/retrofit.dart';

import '../../../../../core/network/urls.dart';
import '../../../../../core/resources/default_response.dart';
import '../../../domain/entity/messages/push_messages.dart';
import '../../../domain/entity/messages/read_messages_response_entities.dart';
import '../../../domain/entity/push_token.dart';
import '../../models/user/chat/chat_user.dart';
import '../../models/user/get_chat_manager/users_dto.dart';


part 'chat_service.g.dart';

@RestApi(baseUrl: Urls.baseURl)
abstract class ChatService {
  factory ChatService(Dio dio, {String baseUrl}) = _ChatService;

  @GET("/get-chat-managers")
  Future<HttpResponse<DefaultResponse<UsersDto>>> getUsers();

  @GET("/get-chat-messages/{id}/20")
  Future<HttpResponse<DefaultResponse<ChatUserDto>>> getChat({
    @Path() required String id,
  });

  @POST("/send-message")
  Future<HttpResponse> sendMessages(
    @Body() SendMessages sendMessages,
  );

  @PUT("/update-app-token")
  Future<HttpResponse> pushToken(
    @Body() PushtokenEntities token,
  );
  @POST('/read-message')
  Future<HttpResponse> readMessages(@Body() ReadMessages messages);
}
