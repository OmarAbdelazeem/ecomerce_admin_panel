import 'package:ecommerce_admin_tut/src/models/name_field_model.dart';
import 'package:ecommerce_admin_tut/src/notifiers/language_notifier.dart';
import 'package:ecommerce_admin_tut/src/notifiers/provider_notifier.dart';
import 'package:ecommerce_admin_tut/src/res/string_constants.dart';
import 'package:ecommerce_admin_tut/src/routes/router.gr.dart';
import 'package:ecommerce_admin_tut/src/ui/screens/add_product_categories_or_banners_screen.dart';
import 'package:ecommerce_admin_tut/src/ui/screens/add_product_category_screen.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return
    //   MaterialApp(
    //   home: AddProductCategoriesField(
    //     productId: '1',
    //     categories: [NameField(arabic: 'فئة رئيسية', english: 'Main category') , NameField(arabic: 'فئة فرعية', english: 'Sub category')],
    //   ),
    // );

      ProviderNotifier(
      child: (LanguageNotifier languageNotifier) {
        return MaterialApp.router(
            // theme: AppTheme.appTheme(),
            debugShowCheckedModeBanner: false,
            routerDelegate: _appRouter.delegate(),
            routeInformationParser: _appRouter.defaultRouteParser(),
            locale: languageNotifier.locale,
            supportedLocales: languageNotifier.supportedLocals,
            localizationsDelegates: languageNotifier.localizationsDelegates,
            localeResolutionCallback: languageNotifier.localResolutionCallback);
      },
    );
  }
}
