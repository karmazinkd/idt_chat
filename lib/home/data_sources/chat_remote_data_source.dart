import 'package:idt_chat/common/helpers/extensions.dart';
import 'package:idt_chat/common/models/result.dart';
import 'package:idt_chat/home/data_sources/chat_api.dart';
import 'package:idt_chat/home/data_sources/i_chat_data_source.dart';
import 'package:idt_chat/home/models/dto/chat_list_item_dto.dart';
import 'package:idt_chat/home/models/dto/chat_message_dto.dart';

class ChatRemoteDataSource implements IChatDataSource {
  final ChatApi _api;

  ChatRemoteDataSource({required ChatApi api}) : _api = api;

  @override
  Future<Result<List<ChatListItemDto>>> fetchChatList() {
    return _api.fetchChatList().toResult();
  }

  @override
  Future<Result<List<ChatMessageDto>>> fetchChatMessages(String chatId) {
    return _api.fetchChatMessages(chatId).toResult();
  }
}
