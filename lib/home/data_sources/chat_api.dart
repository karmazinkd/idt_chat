import 'package:dio/dio.dart';
import 'package:idt_chat/home/models/dto/chat_list_item_dto.dart';
import 'package:idt_chat/home/models/dto/chat_message_dto.dart';
import 'package:retrofit/retrofit.dart';



part 'chat_api.g.dart';

@RestApi()
abstract class ChatApi {
  factory ChatApi(Dio client) = _ChatApi;

  @GET('/programming-test/api/inbox.json')
  Future<List<ChatListItemDto>> fetchChatList();

  @GET('/programming-test/api/{chatId}.json')
  Future<List<ChatMessageDto>> fetchChatMessages(@Path() String chatId);
}