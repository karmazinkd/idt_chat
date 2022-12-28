import 'package:flutter/material.dart';
import 'package:idt_chat/common/models/result.dart';

extension FutureExt<T> on Future<T> {
  Future<Result<T>> toResult() async {
    try {
      return Result<T>.success(data: await this);
    } on Exception catch (e, st) {
      return Result<T>.failed(message: e.toString(), exception: e, stackTrace: st);
    }
  }
}

extension ContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
}
