

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:munich_data_quiz/constants/text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:munich_data_quiz/constants/theme.dart';

class MQApp extends StatefulWidget {

  MQApp({this.child, Key? key})
      : super(key: key ?? UniqueKey());

  Widget? child;
  Locale? locale;

  @override
  State<StatefulWidget> createState() => _MQAppState();
}

class _MQAppState extends State<MQApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: MQTexts.appName,
      debugShowCheckedModeBanner: false,
      theme: MQTheme.theme,
      darkTheme: MQTheme.darkTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      // locale: MQLanguages.toLocale(
      //     Provider.of<LanguageStateHandler>(context).language),
      // localeResolutionCallback: (locale, supportedLocales) {
      //   if (locale == null) return supportedLocales.first;
      //   for (var supportedLocale in supportedLocales) {
      //     if (supportedLocale.languageCode == locale.languageCode &&
      //         supportedLocale.countryCode == locale.countryCode) {
      //       return supportedLocale;
      //     }
      //   }
      //   return supportedLocales.first;
      // },
      home: widget.child,
    );
  }

}