// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../../home/models/bo/chat_list_item_model.dart' as _i5;
import '../../home/ui/pages/chat_list_page.dart' as _i1;
import '../../home/ui/pages/chat_page.dart' as _i2;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    ChatListRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.ChatListPage(),
      );
    },
    ChatRoute.name: (routeData) {
      final args = routeData.argsAs<ChatRouteArgs>();
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.ChatPage(
          model: args.model,
          key: args.key,
        ),
      );
    },
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(
          ChatListRoute.name,
          path: '/',
        ),
        _i3.RouteConfig(
          ChatRoute.name,
          path: '/chat-page',
        ),
      ];
}

/// generated route for
/// [_i1.ChatListPage]
class ChatListRoute extends _i3.PageRouteInfo<void> {
  const ChatListRoute()
      : super(
          ChatListRoute.name,
          path: '/',
        );

  static const String name = 'ChatListRoute';
}

/// generated route for
/// [_i2.ChatPage]
class ChatRoute extends _i3.PageRouteInfo<ChatRouteArgs> {
  ChatRoute({
    required _i5.ChatListItemCardModel model,
    _i4.Key? key,
  }) : super(
          ChatRoute.name,
          path: '/chat-page',
          args: ChatRouteArgs(
            model: model,
            key: key,
          ),
        );

  static const String name = 'ChatRoute';
}

class ChatRouteArgs {
  const ChatRouteArgs({
    required this.model,
    this.key,
  });

  final _i5.ChatListItemCardModel model;

  final _i4.Key? key;

  @override
  String toString() {
    return 'ChatRouteArgs{model: $model, key: $key}';
  }
}
