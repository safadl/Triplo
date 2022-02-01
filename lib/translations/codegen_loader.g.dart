// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "settings_text": "Settings",
  "lang_text": "Language",
  "currency_text": "Currency",
  "theme_text": "Theme",
  "about_txt": "About the project",
  "privacy_txt": "Privacy Policy",
  "logout_txt": "Log out",
  "welc": "Welcome",
  "flights": "Flights",
  "ferries": "Ferries",
  "most_relv": "Most Relevant",
  "hot": "Hot Places",
  "search_txt": "Where would you like to go?"
};
static const Map<String,dynamic> fr = {
  "settings_text": "Paramètres ",
  "lang_text": "Langue",
  "currency_text": "Devise",
  "theme_text": "Thème",
  "about_txt": "A propos",
  "privacy_txt": "Confidentialité",
  "logout_txt": "Se déconnecter",
  "welc": "Bienvenue",
  "flights": "Vols",
  "ferries": "Bateaux",
  "most_relv": "Plus Pertinent",
  "hot": "Endroits Chauds",
  "search_txt": "Où voudrais-tu aller?"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "fr": fr};
}
