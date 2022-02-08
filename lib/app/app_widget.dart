import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LocalJsonLocalization.delegate.directories = [
      'assets/lang',
    ];
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        LocalJsonLocalization.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('es', 'ES'),
        Locale('pt', 'BR'),
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        if (supportedLocales.contains(locale)) {
          return locale;
        }

        if (locale?.languageCode == 'pt') {
          return const Locale('pt', 'BR');
        } else if (locale?.languageCode == 'es') {
          return const Locale('es', 'ES');
        }

        return const Locale('en', 'US');
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        primaryColor: Colors.red,
        scaffoldBackgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.pink),
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: Colors.pink,
              secondary: Colors.white,
            ),
      ),
      initialRoute: '/',
    ).modular();
  }
}
