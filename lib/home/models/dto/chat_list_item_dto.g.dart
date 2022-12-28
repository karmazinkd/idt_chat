// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_list_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatListItemDto _$$_ChatListItemDtoFromJson(Map<String, dynamic> json) =>
    _$_ChatListItemDto(
      id: json['id'] as String? ?? '-1',
      lastMessage: json['last_message'] as String? ?? '',
      members: (json['members'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      topic: json['topic'] as String? ?? '',
      modifiedAt: json['modified_at'] as int? ?? -1,
    );

Map<String, dynamic> _$$_ChatListItemDtoToJson(_$_ChatListItemDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'last_message': instance.lastMessage,
      'members': instance.members,
      'topic': instance.topic,
      'modified_at': instance.modifiedAt,
    };
