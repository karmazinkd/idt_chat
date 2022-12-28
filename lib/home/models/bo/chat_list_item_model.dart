import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ChatListItemCardModel extends Equatable {
  final Color avatarColor;
  final String avatarLetter;
  final String chatTitle;
  final String chatId;
  final String lastMessage;
  final List<String> members;

  ///milliseconds since epoch
  final int modifiedAt;
  final String modifiedTimeFriendly;

  const ChatListItemCardModel({
    required this.avatarColor,
    required this.avatarLetter,
    required this.chatTitle,
    required this.chatId,
    required this.lastMessage,
    required this.members,
    required this.modifiedAt,
    required this.modifiedTimeFriendly,
  });

  @override
  List<Object> get props => [
        avatarColor,
        avatarLetter,
        chatTitle,
        chatId,
        lastMessage,
        members,
        modifiedAt,
        modifiedTimeFriendly,
      ];
}
