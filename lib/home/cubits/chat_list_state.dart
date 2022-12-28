import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:idt_chat/home/models/bo/chat_list_item_model.dart';

part 'chat_list_state.freezed.dart';

@freezed
class ChatListState with _$ChatListState{
  const factory ChatListState.loading() = _Loading;

  const factory ChatListState.failed({required String message}) = _Failure;

  const factory ChatListState.success({
    required List<ChatListItemCardModel> chatList,
}) = _Success;
}