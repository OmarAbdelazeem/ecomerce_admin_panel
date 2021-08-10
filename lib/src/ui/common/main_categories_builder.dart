import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_admin_tut/src/bloc/main_categories/main_categories.dart';
import 'package:ecommerce_admin_tut/src/models/main_category_model.dart';
import 'package:ecommerce_admin_tut/src/ui/common/no_categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'main_category_item.dart';


class MainCategoriesDataBuilder extends StatelessWidget {
  final MainCategoriesCubit mainCategoriesCubit;
  MainCategoriesDataBuilder(this.mainCategoriesCubit);
  @override
  Widget build(BuildContext context) {

    Widget mainCategoriesList(List<MainCategoryModel> categories) {
      return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            childAspectRatio: 1.07,
            mainAxisSpacing: 10),
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return MainCategoryItem(
            categories[index],
          );
        },
      );
    }

    return BlocBuilder<MainCategoriesCubit,MainCategoriesState>(
        bloc: mainCategoriesCubit,
        builder: (BuildContext context, MainCategoriesState state) {
          if (state is Loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is Loaded) {
            return state.categories.isEmpty
                ? noCategories(context)
                : mainCategoriesList(state.categories);
          } else if (state is Error) {
            return Text(state.error.toString());
          }
          return Container();
        });
  }
}


