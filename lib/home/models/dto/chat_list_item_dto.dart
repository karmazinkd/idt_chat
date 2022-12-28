
import 'package:freezed_annotation/freezed_annotation.dart';
part 'chat_list_item_dto.freezed.dart';
part 'chat_list_item_dto.g.dart';

@freezed
class ChatListItemDto with _$ChatListItemDto{
   const factory ChatListItemDto({
    @Default('-1') String id,
     @JsonKey(name: 'last_message')  @Default('') String lastMessage,
    @Default(<String>[]) List<String> members,
    @Default('') String topic,
     @JsonKey(name: 'modified_at') @Default(-1) int modifiedAt,
}) = _ChatListItemDto;

  const ChatListItemDto._();

  factory ChatListItemDto.fromJson(Map<String, dynamic> json) => _$ChatListItemDtoFromJson(json);
}