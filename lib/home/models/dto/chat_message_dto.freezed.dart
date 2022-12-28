// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'chat_message_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatMessageDto _$ChatMessageDtoFromJson(Map<String, dynamic> json) {
  return _ChatMessageDto.fromJson(json);
}

/// @nodoc
mixin _$ChatMessageDto {
  String get id => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'modified_at')
  int get modifiedAt => throw _privateConstructorUsedError;
  String get sender => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatMessageDtoCopyWith<ChatMessageDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatMessageDtoCopyWith<$Res> {
  factory $ChatMessageDtoCopyWith(
          ChatMessageDto value, $Res Function(ChatMessageDto) then) =
      _$ChatMessageDtoCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String message,
      @JsonKey(name: 'modified_at') int modifiedAt,
      String sender});
}

/// @nodoc
class _$ChatMessageDtoCopyWithImpl<$Res>
    implements $ChatMessageDtoCopyWith<$Res> {
  _$ChatMessageDtoCopyWithImpl(this._value, this._then);

  final ChatMessageDto _value;
  // ignore: unused_field
  final $Res Function(ChatMessageDto) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? message = freezed,
    Object? modifiedAt = freezed,
    Object? sender = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      modifiedAt: modifiedAt == freezed
          ? _value.modifiedAt
          : modifiedAt // ignore: cast_nullable_to_non_nullable
              as int,
      sender: sender == freezed
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_ChatMessageDtoCopyWith<$Res>
    implements $ChatMessageDtoCopyWith<$Res> {
  factory _$$_ChatMessageDtoCopyWith(
          _$_ChatMessageDto value, $Res Function(_$_ChatMessageDto) then) =
      __$$_ChatMessageDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String message,
      @JsonKey(name: 'modified_at') int modifiedAt,
      String sender});
}

/// @nodoc
class __$$_ChatMessageDtoCopyWithImpl<$Res>
    extends _$ChatMessageDtoCopyWithImpl<$Res>
    implements _$$_ChatMessageDtoCopyWith<$Res> {
  __$$_ChatMessageDtoCopyWithImpl(
      _$_ChatMessageDto _value, $Res Function(_$_ChatMessageDto) _then)
      : super(_value, (v) => _then(v as _$_ChatMessageDto));

  @override
  _$_ChatMessageDto get _value => super._value as _$_ChatMessageDto;

  @override
  $Res call({
    Object? id = freezed,
    Object? message = freezed,
    Object? modifiedAt = freezed,
    Object? sender = freezed,
  }) {
    return _then(_$_ChatMessageDto(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      modifiedAt: modifiedAt == freezed
          ? _value.modifiedAt
          : modifiedAt // ignore: cast_nullable_to_non_nullable
              as int,
      sender: sender == freezed
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChatMessageDto extends _ChatMessageDto {
  const _$_ChatMessageDto(
      {this.id = '-1',
      this.message = '',
      @JsonKey(name: 'modified_at') this.modifiedAt = -1,
      this.sender = ''})
      : super._();

  factory _$_ChatMessageDto.fromJson(Map<String, dynamic> json) =>
      _$$_ChatMessageDtoFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String message;
  @override
  @JsonKey(name: 'modified_at')
  final int modifiedAt;
  @override
  @JsonKey()
  final String sender;

  @override
  String toString() {
    return 'ChatMessageDto(id: $id, message: $message, modifiedAt: $modifiedAt, sender: $sender)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatMessageDto &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.message, message) &&
            const DeepCollectionEquality()
                .equals(other.modifiedAt, modifiedAt) &&
            const DeepCollectionEquality().equals(other.sender, sender));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(message),
      const DeepCollectionEquality().hash(modifiedAt),
      const DeepCollectionEquality().hash(sender));

  @JsonKey(ignore: true)
  @override
  _$$_ChatMessageDtoCopyWith<_$_ChatMessageDto> get copyWith =>
      __$$_ChatMessageDtoCopyWithImpl<_$_ChatMessageDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatMessageDtoToJson(
      this,
    );
  }
}

abstract class _ChatMessageDto extends ChatMessageDto {
  const factory _ChatMessageDto(
      {final String id,
      final String message,
      @JsonKey(name: 'modified_at') final int modifiedAt,
      final String sender}) = _$_ChatMessageDto;
  const _ChatMessageDto._() : super._();

  factory _ChatMessageDto.fromJson(Map<String, dynamic> json) =
      _$_ChatMessageDto.fromJson;

  @override
  String get id;
  @override
  String get message;
  @override
  @JsonKey(name: 'modified_at')
  int get modifiedAt;
  @override
  String get sender;
  @override
  @JsonKey(ignore: true)
  _$$_ChatMessageDtoCopyWith<_$_ChatMessageDto> get copyWith =>
      throw _privateConstructorUsedError;
}
