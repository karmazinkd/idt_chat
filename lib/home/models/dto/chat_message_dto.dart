
import 'package:freezed_annotation/freezed_annotation.dart';
part 'chat_message_dto.freezed.dart';
part 'chat_message_dto.g.dart';

@freezed
class ChatMessageDto with _$ChatMessageDto{
  const factory ChatMessageDto({
    @Default('-1') String id,
    @Default('') String message,
    @JsonKey(name: 'modified_at') @Default(-1) int modifiedAt,
    @Default('') String sender,
  }) = _ChatMessageDto;

  const ChatMessageDto._();

  factory ChatMessageDto.fromJson(Map<String, dynamic> json) => _$ChatMessageDtoFromJson(json);
}