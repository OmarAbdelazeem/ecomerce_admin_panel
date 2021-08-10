import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_admin_tut/src/bloc/sub_categories/sub_categories.dart';
import 'package:ecommerce_admin_tut/src/di/app_injector.dart';
import 'package:ecommerce_admin_tut/src/notifiers/sub_categories_notifier.dart';
import 'package:ecommerce_admin_tut/src/routes/router.gr.dart';
import 'package:ecommerce_admin_tut/src/ui/common/sub_category_item.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_admin_tut/src/bloc/sub_categories/sub_categories.dart'
    as sub_categories;
import 'package:flutter_bloc/flutter_bloc.dart';

class SubCategoriesBuilder extends StatelessWidget {
  final SubCategoriesCubit subCategoriesCubit;

  SubCategoriesBuilder(this.subCategoriesCubit);

  @override
  Widget build(BuildContext context) {
    late StackRouter appRouter = AutoRouter.of(context);
    return BlocBuilder<sub_categories.SubCategoriesCubit,
        sub_categories.SubCategoriesState>(
      bloc: subCategoriesCubit,
      builder: (BuildContext context, sub_categories.SubCategoriesState state) {
        if (state is sub_categories.Loading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is sub_categories.Loaded) {
          return ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: state.subCategories.length,
            itemBuilder: (BuildContext context, int index) {
              void onSubCategoryItemTapped() {
                final subCategoriesNotifier =
                    getItInstance<SubCategoriesNotifier>();
                subCategoriesNotifier
                    .setCurrentSubCategory(state.subCategories[index]);
                appRouter.push(
                    SubCategoryDetailsScreen(subCategory: state.subCategories[index]));
              }

              return SubCategoryItem(
                subCategory: state.subCategories[index],
                onTap: onSubCategoryItemTapped,
                isEnglish: true,
              );
            },
          );
        }
        return Container();
      },
    );
  }
}
