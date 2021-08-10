import 'package:ecommerce_admin_tut/src/core/utils/localization/set_localization.dart';
import 'package:ecommerce_admin_tut/src/models/language_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class LanguageNotifier extends ChangeNotifier {
  Locale? _locale;

  bool _isEnglish = true;

  LanguageModel? languageOption;

  List<Locale> _supportedLocals = [Locale('en', 'US'), Locale('ar', 'EG')];

  Iterable<LocalizationsDelegate<dynamic>>? _localizationsDelegates = [
    SetLocalization.localizationsDelegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  void setLocale(Locale? locale) {
    _locale = locale;
    notifyListeners();
  }

  Locale? get locale => _locale;

  get isEnglish => _isEnglish;


  get supportedLocals => _supportedLocals;




  Iterable<LocalizationsDelegate<dynamic>>? get localizationsDelegates =>
      _localizationsDelegates!;

  Locale? localResolutionCallback(
      Locale? deviceLocal, Iterable<Locale>? localeResolutionCallback) {
    for (var local in localeResolutionCallback!) {
      if (local.languageCode == deviceLocal!.languageCode &&
          local.countryCode == deviceLocal.countryCode) {
        _locale = deviceLocal;
        if(locale!.languageCode == 'en'){
          _isEnglish = true;
          languageOption = LanguageModel.languageList()[0];
        }

        else if(locale!.languageCode == 'ar'){
          _isEnglish = false;
          languageOption = LanguageModel.languageList()[1];
        }

        return deviceLocal;
      }
    }
    return localeResolutionCallback.first;
  }
}
