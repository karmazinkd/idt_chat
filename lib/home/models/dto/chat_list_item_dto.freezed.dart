// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'chat_list_item_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatListItemDto _$ChatListItemDtoFromJson(Map<String, dynamic> json) {
  return _ChatListItemDto.fromJson(json);
}

/// @nodoc
mixin _$ChatListItemDto {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_message')
  String get lastMessage => throw _privateConstructorUsedError;
  List<String> get members => throw _privateConstructorUsedError;
  String get topic => throw _privateConstructorUsedError;
  @JsonKey(name: 'modified_at')
  int get modifiedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatListItemDtoCopyWith<ChatListItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatListItemDtoCopyWith<$Res> {
  factory $ChatListItemDtoCopyWith(
          ChatListItemDto value, $Res Function(ChatListItemDto) then) =
      _$ChatListItemDtoCopyWithImpl<$Res>;
  $Res call(
      {String id,
      @JsonKey(name: 'last_message') String lastMessage,
      List<String> members,
      String topic,
      @JsonKey(name: 'modified_at') int modifiedAt});
}

/// @nodoc
class _$ChatListItemDtoCopyWithImpl<$Res>
    implements $ChatListItemDtoCopyWith<$Res> {
  _$ChatListItemDtoCopyWithImpl(this._value, this._then);

  final ChatListItemDto _value;
  // ignore: unused_field
  final $Res Function(ChatListItemDto) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? lastMessage = freezed,
    Object? members = freezed,
    Object? topic = freezed,
    Object? modifiedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      lastMessage: lastMessage == freezed
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as String,
      members: members == freezed
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<String>,
      topic: topic == freezed
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String,
      modifiedAt: modifiedAt == freezed
          ? _value.modifiedAt
          : modifiedAt // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_ChatListItemDtoCopyWith<$Res>
    implements $ChatListItemDtoCopyWith<$Res> {
  factory _$$_ChatListItemDtoCopyWith(
          _$_ChatListItemDto value, $Res Function(_$_ChatListItemDto) then) =
      __$$_ChatListItemDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      @JsonKey(name: 'last_message') String lastMessage,
      List<String> members,
      String topic,
      @JsonKey(name: 'modified_at') int modifiedAt});
}

/// @nodoc
class __$$_ChatListItemDtoCopyWithImpl<$Res>
    extends _$ChatListItemDtoCopyWithImpl<$Res>
    implements _$$_ChatListItemDtoCopyWith<$Res> {
  __$$_ChatListItemDtoCopyWithImpl(
      _$_ChatListItemDto _value, $Res Function(_$_ChatListItemDto) _then)
      : super(_value, (v) => _then(v as _$_ChatListItemDto));

  @override
  _$_ChatListItemDto get _value => super._value as _$_ChatListItemDto;

  @override
  $Res call({
    Object? id = freezed,
    Object? lastMessage = freezed,
    Object? members = freezed,
    Object? topic = freezed,
    Object? modifiedAt = freezed,
  }) {
    return _then(_$_ChatListItemDto(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      lastMessage: lastMessage == freezed
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as String,
      members: members == freezed
          ? _value._members
          : members // ignore: cast_nullable_to_non_nullable
              as List<String>,
      topic: topic == freezed
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String,
      modifiedAt: modifiedAt == freezed
          ? _value.modifiedAt
          : modifiedAt // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChatListItemDto extends _ChatListItemDto {
  const _$_ChatListItemDto(
      {this.id = '-1',
      @JsonKey(name: 'last_message') this.lastMessage = '',
      final List<String> members = const <String>[],
      this.topic = '',
      @JsonKey(name: 'modified_at') this.modifiedAt = -1})
      : _members = members,
        super._();

  factory _$_ChatListItemDto.fromJson(Map<String, dynamic> json) =>
      _$$_ChatListItemDtoFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey(name: 'last_message')
  final String lastMessage;
  final List<String> _members;
  @override
  @JsonKey()
  List<String> get members {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_members);
  }

  @override
  @JsonKey()
  final String topic;
  @override
  @JsonKey(name: 'modified_at')
  final int modifiedAt;

  @override
  String toString() {
    return 'ChatListItemDto(id: $id, lastMessage: $lastMessage, members: $members, topic: $topic, modifiedAt: $modifiedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatListItemDto &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.lastMessage, lastMessage) &&
            const DeepCollectionEquality().equals(other._members, _members) &&
            const DeepCollectionEquality().equals(other.topic, topic) &&
            const DeepCollectionEquality()
                .equals(other.modifiedAt, modifiedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(lastMessage),
      const DeepCollectionEquality().hash(_members),
      const DeepCollectionEquality().hash(topic),
      const DeepCollectionEquality().hash(modifiedAt));

  @JsonKey(ignore: true)
  @override
  _$$_ChatListItemDtoCopyWith<_$_ChatListItemDto> get copyWith =>
      __$$_ChatListItemDtoCopyWithImpl<_$_ChatListItemDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatListItemDtoToJson(
      this,
    );
  }
}

abstract class _ChatListItemDto extends ChatListItemDto {
  const factory _ChatListItemDto(
      {final String id,
      @JsonKey(name: 'last_message') final String lastMessage,
      final List<String> members,
      final String topic,
      @JsonKey(name: 'modified_at') final int modifiedAt}) = _$_ChatListItemDto;
  const _ChatListItemDto._() : super._();

  factory _ChatListItemDto.fromJson(Map<String, dynamic> json) =
      _$_ChatListItemDto.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'last_message')
  String get lastMessage;
  @override
  List<String> get members;
  @override
  String get topic;
  @override
  @JsonKey(name: 'modified_at')
  int get modifiedAt;
  @override
  @JsonKey(ignore: true)
  _$$_ChatListItemDtoCopyWith<_$_ChatListItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}
