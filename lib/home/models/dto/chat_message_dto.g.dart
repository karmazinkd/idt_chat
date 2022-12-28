// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatMessageDto _$$_ChatMessageDtoFromJson(Map<String, dynamic> json) =>
    _$_ChatMessageDto(
      id: json['id'] as String? ?? '-1',
      message: json['message'] as String? ?? '',
      modifiedAt: json['modified_at'] as int? ?? -1,
      sender: json['sender'] as String? ?? '',
    );

Map<String, dynamic> _$$_ChatMessageDtoToJson(_$_ChatMessageDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'message': instance.message,
      'modified_at': instance.modifiedAt,
      'sender': instance.sender,
    };
