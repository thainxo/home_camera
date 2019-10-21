import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'ui/home.dart';
import 'utils/language.dart';
import 'utils/constans.dart';

class Application extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Support multi language
      localizationsDelegates: [
        const LanguageDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale("en", "US"),
        const Locale("vi","VN"),
      ],
      onGenerateTitle: (BuildContext context) => Language.of(context).text(Constants.appName),
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.deepPurple,
      ),
      home: Home(Constants.homeTitle),
    );
  }
}