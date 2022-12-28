import 'package:auto_route/auto_route.dart';
import 'package:idt_chat/home/ui/pages/chat_list_page.dart';
import 'package:idt_chat/home/ui/pages/chat_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute<dynamic>>[
    AutoRoute(page: ChatListPage, initial: true),
    AutoRoute(page: ChatPage),
  ],
)
class $AppRouter {}
