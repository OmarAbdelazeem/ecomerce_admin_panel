import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_admin_tut/src/core/utils/localization/localization_methods.dart';
import 'package:ecommerce_admin_tut/src/res/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_admin_tut/src/routes/router.gr.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final BuildContext? passedContext;
  final String screenTitle;


  BaseAppBar(
    this.screenTitle, {
    @required this.passedContext,
  });

  @override
  Widget build(BuildContext context) {
    StackRouter appRouter;
    void Function()? filterTapFunction;
    void Function()? searchTapFunction;

    bool checkFilterScreen() {
      bool haveFilterScreen = screenTitle == StringsConstants.orders ||
          screenTitle == StringsConstants.products;
      if (screenTitle == StringsConstants.orders) {
        filterTapFunction = () {
          appRouter = AutoRouter.of(passedContext!);
          appRouter.push(FilterAndSortingOrdersScreen());
        };
      } else if (screenTitle == StringsConstants.products)
        filterTapFunction = () {
          appRouter = AutoRouter.of(passedContext!);
          appRouter.push(FilterAndSortingProductsScreen());
        };
      return haveFilterScreen;
    }

    bool checkSearchScreen() {
      bool haveSearchScreen = screenTitle == StringsConstants.customers ||
          screenTitle == StringsConstants.products ||
          screenTitle == StringsConstants.orders;

     if(haveSearchScreen){
       appRouter = AutoRouter.of(passedContext!);
       searchTapFunction = () {
         appRouter.push(SearchScreen(screenTitle: screenTitle));
       };
     }

      return haveSearchScreen;
    }

    return AppBar(
      title: Text(getTranslated(context, screenTitle)!),
      actions: [
        checkSearchScreen()
            ? IconButton(
                icon: Icon(Icons.search),
                onPressed: searchTapFunction)
            : Container(),
        checkFilterScreen()
            ? IconButton(
                onPressed: filterTapFunction, icon: Icon(Icons.filter_alt))
            : Container()
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
