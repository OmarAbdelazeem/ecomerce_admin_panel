
import 'package:ecommerce_admin_tut/src/core/utils/localization/set_localization.dart';
import 'package:ecommerce_admin_tut/src/di/app_injector.dart';
import 'package:ecommerce_admin_tut/src/models/language_model.dart';
import 'package:ecommerce_admin_tut/src/notifiers/language_notifier.dart';
import 'package:flutter/material.dart';

String? getTranslated(BuildContext ?context, String? key) {
  return SetLocalization.of(context!)!.getTranslateValue(key!);
}
void changeLanguage(BuildContext context,LanguageModel? lang) {
  final languageNotifier = getItInstance<LanguageNotifier>();
  Locale _temp;
  switch (lang!.languageCode) {
    case 'en':
      _temp = Locale(lang.languageCode, 'US');
      break;
    case 'ar':
      _temp = Locale(lang.languageCode, 'EG');
      break;
    default:
      _temp = Locale('en', 'US');
      break;
  }
  languageNotifier.setLocale(_temp);
}
