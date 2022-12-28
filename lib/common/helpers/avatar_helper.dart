import 'package:flutter/material.dart';

abstract class AvatarHelper {
  static Color generateColorFromText(String text) {
    int idx = text.hashCode % 10; // 0 - 9

    const colors = <Color>[
      Color(0xFFBF360C),
      Color(0xFFF57F17),
      Color(0xFFC51162),
      Color(0xFF004D40),
      Color(0xFF01579B),
      Color(0xFF1B5E20),
      Color(0xFF3E2723),
      Colors.deepPurple,
      Color(0xFF263238),
      Color(0xFF0D47A1),
    ];

    return colors[idx];
  }

  static String getAvatarLetterForGroup(List<String> members, String topic) {
    if (members.isEmpty) {
      return '';
    } else if (members.length == 1) {
      return AvatarHelper._getFirstLetter(members[0]);
    } else {
      return AvatarHelper._getFirstLetter(topic);
    }
  }

  static String getAvatarLetterForPrivate(String name) {
    if (name.isEmpty) {
      return '';
    } else {
      return AvatarHelper._getFirstLetter(name);
    }
  }

  static String _getFirstLetter(String text) {
    if (text.isEmpty) {
      return '';
    }

    text.trim();
    return text.substring(0, 1).toUpperCase();
  }
}
