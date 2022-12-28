import 'package:flutter/material.dart';

class ChatMessageModel {
  final String message;
  final String sender;
  final String avatarLetter;
  final Color avatarColor;
  final int modifiedAt;
  final String modifiedTimeFriendly;
  final bool isOwners;

  const ChatMessageModel({
    required this.message,
    required this.sender,
    required this.avatarLetter,
    required this.avatarColor,
    required this.modifiedAt,
    required this.modifiedTimeFriendly,
    this.isOwners = false,
  });
}
