import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idt_chat/common/helpers/avatar_helper.dart';
import 'package:idt_chat/common/helpers/date_time_helper.dart';
import 'package:idt_chat/common/helpers/injections.dart';
import 'package:idt_chat/home/cubits/chat_state.dart';
import 'package:idt_chat/home/models/bo/chat_list_item_model.dart';
import 'package:idt_chat/home/models/bo/chat_message_model.dart';
import 'package:idt_chat/home/models/dto/chat_message_dto.dart';
import 'package:idt_chat/home/repositories/i_chat_repository.dart';

class ChatCubit extends Cubit<ChatState> {
  final IChatRepository _repository;
  final ChatListItemCardModel _chatModel;
  final List<ChatMessageModel> _messageList = [];

  ChatCubit({
    required IChatRepository repository,
    required ChatListItemCardModel chatModel,
  })  : _repository = repository,
        _chatModel = chatModel,
        super(const ChatState.loading());

  ///Fetch data for the page and emit either successful or failed state
  Future<void> fetch() async {
    emit(const ChatState.loading());

    final res = await _repository.fetchChatMessages(_chatModel.chatId);

    final state = res.map(success: (success) {
      return ChatState.success(
        messages: _convertResponseToUiModels(success.data),
        uniqueValue: DateTime.now().millisecondsSinceEpoch,
      );
    }, failed: (failure) {
      return ChatState.failed(message: tr.oopsSomethingWentWrong);
    });

    emit(state);
  }

  /// Adds the input message to the chat and triggers another dummy message ine 2 sec
  Future<void> sendMessage(String message) async {
    var now = DateTime.now().millisecondsSinceEpoch;
    _messageList.add(ChatMessageModel(
        sender: '',
        isOwners: true,
        avatarColor: AvatarHelper.generateColorFromText(''),
        avatarLetter: AvatarHelper.getAvatarLetterForPrivate(''),
        message: message,
        modifiedAt: now,
        modifiedTimeFriendly: DateTimeHelper.formatFriendly(now)));

    emit(ChatState.success(
        messages: _messageList, uniqueValue: DateTime.now().millisecondsSinceEpoch));

    //dummy response:
    await Future.delayed(const Duration(seconds: 2));

    now = DateTime.now().millisecondsSinceEpoch;
    final sender = _chatModel.members[0];
    _messageList.add(ChatMessageModel(
        sender: sender,
        avatarColor: AvatarHelper.generateColorFromText(sender),
        avatarLetter: AvatarHelper.getAvatarLetterForPrivate(sender),
        message: tr.dummyResponse,
        modifiedAt: now,
        modifiedTimeFriendly: DateTimeHelper.formatFriendly(now)));

    emit(ChatState.success(
        messages: _messageList, uniqueValue: DateTime.now().millisecondsSinceEpoch));
  }

  List<ChatMessageModel> _convertResponseToUiModels(List<ChatMessageDto> respItems) {
    final list = respItems
        .map((dto) => ChatMessageModel(
              sender: dto.sender,
              avatarColor: AvatarHelper.generateColorFromText(dto.sender),
              avatarLetter: AvatarHelper.getAvatarLetterForPrivate(dto.sender),
              message: dto.message,
              modifiedAt: dto.modifiedAt,
              modifiedTimeFriendly: DateTimeHelper.formatFriendly(dto.modifiedAt),
            ))
        .toList();

    _messageList.addAll(list);
    _messageList.sort((a, b) => b.modifiedAt.compareTo(a.modifiedAt));
    return list;
  }
}
