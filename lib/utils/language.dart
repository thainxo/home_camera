import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class Language {
    Locale locale;
    static Map<dynamic, dynamic> localizedValue;
    Language(Locale locale) {
      this.locale = locale;
      localizedValue = null;
    }

    static Future<Language> load(Locale locale) async {
      Language language = new Language(locale);
      String jsonContent  = await rootBundle.loadString("lib/res/locale/${locale.languageCode}.json");
      localizedValue = json.decode(jsonContent);
      return language;
    }

    String text(String key) {
      return localizedValue[key] ?? key;
    }

    get currentLanguage {
      return locale.languageCode;
    }

    static Language of(BuildContext context) {
      return Localizations.of<Language>(context, Language);
    }
}

class LanguageDelegate extends LocalizationsDelegate<Language> {
  const LanguageDelegate();

  final List supportedLanguages = const ["en", "vi"];

  @override
  bool isSupported(Locale locale) {
    bool result = false;
    if (locale != null) {
      result = supportedLanguages.contains(locale.languageCode);
    }
    return result;
  }

  @override
  Future<Language> load(Locale locale) => Language.load(locale);

  @override
  bool shouldReload(LanguageDelegate old) {
    return false;
  }
}