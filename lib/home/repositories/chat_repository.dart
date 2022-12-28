import 'package:idt_chat/common/models/result.dart';
import 'package:idt_chat/home/data_sources/i_chat_data_source.dart';
import 'package:idt_chat/home/models/dto/chat_list_item_dto.dart';
import 'package:idt_chat/home/models/dto/chat_message_dto.dart';
import 'package:idt_chat/home/repositories/i_chat_repository.dart';

class ChatDefaultRepository implements IChatRepository {
  final IChatDataSource _remoteDataSource;

  ChatDefaultRepository({required IChatDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;

  @override
  Future<Result<List<ChatListItemDto>>> fetchChatList() {
    return _remoteDataSource.fetchChatList();
  }

  @override
  Future<Result<List<ChatMessageDto>>> fetchChatMessages(String chatId) {
    return _remoteDataSource.fetchChatMessages(chatId);
  }
}
