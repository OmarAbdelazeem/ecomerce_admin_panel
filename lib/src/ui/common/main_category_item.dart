import 'package:ecommerce_admin_tut/src/notifiers/main_categories_notifier.dart';
import 'package:ecommerce_admin_tut/src/routes/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_admin_tut/src/di/app_injector.dart';
import 'package:ecommerce_admin_tut/src/models/main_category_model.dart';

import 'package:ecommerce_admin_tut/src/notifiers/language_notifier.dart';
import 'package:flutter/material.dart';

class MainCategoryItem extends StatelessWidget {
  final MainCategoryModel category;

  MainCategoryItem(this.category);

  @override
  Widget build(BuildContext context) {
    final languageProvider = getItInstance<LanguageNotifier>();
    final mainCategoriesNotifier = getItInstance<MainCategoriesNotifier>();
    final appRouter = AutoRouter.of(context);
    return GestureDetector(
        onTap: () {
          mainCategoriesNotifier.setCurrentMainCategory(category);
          appRouter.push(MainCategoryDetailsScreen(mainCategory: category));

        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 5),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.grey.shade100,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                Icon(
                  Icons.category,
                  size: 50,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  languageProvider.isEnglish ? category.name.english : category.name.arabic,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                )
              ],
            ),
          ),
        ));
  }
}
