import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idt_chat/common/helpers/avatar_helper.dart';
import 'package:idt_chat/common/helpers/date_time_helper.dart';
import 'package:idt_chat/common/helpers/injections.dart';
import 'package:idt_chat/home/cubits/chat_list_state.dart';
import 'package:idt_chat/home/models/bo/chat_list_item_model.dart';
import 'package:idt_chat/home/models/dto/chat_list_item_dto.dart';
import 'package:idt_chat/home/repositories/i_chat_repository.dart';

class ChatListCubit extends Cubit<ChatListState> {
  final IChatRepository _repository;
  final List<ChatListItemCardModel> _chatList = [];

  ChatListCubit({required IChatRepository repository})
      : _repository = repository,
        super(const ChatListState.loading());

  ///Fetch data for the page and emit either successful or failed state
  Future<void> fetch() async{
    emit(const ChatListState.loading());

    final res = await _repository.fetchChatList();

    final state = res.map(success: (success){
      return ChatListState.success(chatList: _convertResponseToUiModels(success.data));
    }, failed: (failure){
      return ChatListState.failed(message: tr.oopsSomethingWentWrong);
    });

    emit(state);
  }

  List<ChatListItemCardModel> _convertResponseToUiModels(List<ChatListItemDto> respItems){
    final list = respItems.map((dto) => ChatListItemCardModel(
      avatarColor: AvatarHelper.generateColorFromText(dto.topic),
      avatarLetter: AvatarHelper.getAvatarLetterForGroup(dto.members, dto.topic),
      chatTitle: _getCardTitle(dto),
      chatId: dto.id,
      lastMessage: dto.lastMessage,
      members: dto.members,
      modifiedAt: dto.modifiedAt,
      modifiedTimeFriendly: DateTimeHelper.formatFriendly(dto.modifiedAt),
    )).toList();

    _chatList.addAll(list);
    _chatList.sort((a,b) => b.modifiedAt.compareTo(a.modifiedAt));

    return _chatList;
  }

  String _getCardTitle(ChatListItemDto dto) {
    if(dto.members.isEmpty){
      return '';
    }else if(dto.members.length == 1){
      return dto.members[0];
    }else{
      return dto.topic;
    }
  }
}
