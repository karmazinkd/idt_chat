import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:idt_chat/common/helpers/injections.dart';
import 'package:idt_chat/common/helpers/router.gr.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:idt_chat/l10n/l10n.dart';

void main() {
  setUpInjections();

  runApp(
    ScreenUtilInit(
      designSize: const Size(385, 812), // design sizes in Figma
      builder: (_, __) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'IDT Chat',
      theme:  ThemeData(primarySwatch: Colors.red),
      debugShowCheckedModeBanner: false,
      routerDelegate: getIt<AppRouter>().delegate(),
      routeInformationParser: getIt<AppRouter>().defaultRouteParser(),
      supportedLocales: const [L10n.english],
      localizationsDelegates: const <LocalizationsDelegate<Object>>[
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      builder: (context, widget) {
        tr = AppLocalizations.of(context);
        return widget ?? const SizedBox.shrink();
      },
    );
  }
}