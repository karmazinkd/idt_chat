import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:idt_chat/common/helpers/router.gr.dart';
import 'package:idt_chat/common/network/api_manager.dart';
import 'package:idt_chat/home/data_sources/chat_api.dart';
import 'package:idt_chat/home/data_sources/chat_remote_data_source.dart';
import 'package:idt_chat/home/repositories/chat_repository.dart';
import 'package:idt_chat/home/repositories/i_chat_repository.dart';

final GetIt getIt = GetIt.instance;

///Static instance of AppLocalizations - a shortcut to get translations without a context
late AppLocalizations tr;

setUpInjections() {
  final dioClient = ApiManager.getDioClient();
  getIt.registerSingleton<ChatRemoteDataSource>(ChatRemoteDataSource(api: ChatApi(dioClient)));

  getIt.registerSingleton<IChatRepository>(
    ChatDefaultRepository(remoteDataSource: getIt<ChatRemoteDataSource>()),
  );

  getIt.registerSingleton(AppRouter());
}
