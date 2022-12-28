import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:idt_chat/home/models/bo/chat_message_model.dart';

part 'chat_state.freezed.dart';

@freezed
class ChatState with _$ChatState{
  const factory ChatState.loading() = _Loading;

  const factory ChatState.failed({required String message}) = _Failure;

  const factory ChatState.success({
    required List<ChatMessageModel> messages,
    ///unique values so that bloc doesn't filter out the same states
    required int uniqueValue,
  }) = _Success;
}