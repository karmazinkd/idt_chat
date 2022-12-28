import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

abstract class DateTimeHelper {
  /// Example: Jan 6
  static String mmmD(DateTime date) => DateFormat('MMM d').format(date);

  ///Example: 09:25 P.M.
  static String hhMMaa(DateTime inputTime) {
    return DateFormat('h:mm a').format(inputTime);
  }

  static String formatFriendly(int millisSinceEpoch) {
    if (millisSinceEpoch < 1) {
      return '';
    }

    final givenDatetime = DateTime.fromMillisecondsSinceEpoch(millisSinceEpoch);
    if (DateUtils.isSameDay(DateTime.now(), givenDatetime)) {
      return hhMMaa(givenDatetime);
    } else {
      return mmmD(givenDatetime);
    }
  }
}
