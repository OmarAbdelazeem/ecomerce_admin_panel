import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_admin_tut/src/bloc/main_categories/main_categories.dart'
    as main_categories;
import 'package:ecommerce_admin_tut/src/routes/router.gr.dart';
import 'package:ecommerce_admin_tut/src/ui/common/main_categories_builder.dart';
import 'package:ecommerce_admin_tut/src/di/app_injector.dart';
import 'package:ecommerce_admin_tut/src/notifiers/main_categories_notifier.dart';
import 'package:ecommerce_admin_tut/src/notifiers/provider_notifier.dart';
import 'package:flutter/material.dart';



class MainCategoriesScreen extends StatefulWidget {
  @override
  _MainCategoriesScreenState createState() => _MainCategoriesScreenState();
}

class _MainCategoriesScreenState extends State<MainCategoriesScreen>
    with AutomaticKeepAliveClientMixin<MainCategoriesScreen> {
  final mainCategoriesCubit =
      getItInstance<main_categories.MainCategoriesCubit>();

  late StackRouter appRouter;

  @override
  void initState() {
    fetchMainCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    appRouter = AutoRouter.of(context);
    return Scaffold(
      body: ProviderNotifier(
        child: (MainCategoriesNotifier mainCategoriesNotifier) {
          if(mainCategoriesNotifier.isMainCategoryAdded){
            mainCategoriesCubit
                .addNewMainCategoryLocally(mainCategoriesNotifier.mainCategory);
            mainCategoriesNotifier.backToDefault();
          }
       else if (mainCategoriesNotifier.isMainCategoryRemoved) {
            mainCategoriesCubit
                .removeMainCategoryLocally(mainCategoriesNotifier.mainCategory);
            mainCategoriesNotifier.backToDefault();
          }
          return MainCategoriesDataBuilder(mainCategoriesCubit);
        },
      ),
      floatingActionButton: floatingActionButton(),
    );
  }

  Future fetchMainCategories() async {
    mainCategoriesCubit.fetchCategories();
  }

  Widget floatingActionButton() {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () async {
        appRouter.push(AddMainCategoryScreen());
      },
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
