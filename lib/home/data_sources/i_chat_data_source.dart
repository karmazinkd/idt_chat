import 'package:idt_chat/common/models/result.dart';
import 'package:idt_chat/home/models/dto/chat_list_item_dto.dart';
import 'package:idt_chat/home/models/dto/chat_message_dto.dart';

abstract class IChatDataSource {
  Future<Result<List<ChatListItemDto>>> fetchChatList();
  Future<Result<List<ChatMessageDto>>> fetchChatMessages(String chatId);
}
