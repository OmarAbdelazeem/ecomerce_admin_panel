import 'package:ecommerce_admin_tut/src/notifiers/language_notifier.dart';
import 'package:ecommerce_admin_tut/src/notifiers/provider_notifier.dart';
import 'package:ecommerce_admin_tut/src/ui/common/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_admin_tut/src/bloc/products/products.dart';
import 'no_products.dart';

Widget productsDataBuilder(
    {required ProductsCubit productsCubit,
    bool productCanBeSelected = false,
    bool productCanBeEdited = false}) {
  return BlocBuilder<ProductsCubit, ProductsState>(
    bloc: productsCubit,
    builder: (context, state) {
      if (state is Loaded) {
        if (state.products.isEmpty) {
          return Center(
            child: noProducts(context),
          );
        }
        return ListView.builder(
          // controller: scrollController,
          itemCount: state.products.length,
          itemBuilder: (BuildContext context, int index) {
            return ProviderNotifier(child: (LanguageNotifier languageNotifier) {
              return ProductCard(
                product: state.products[index],
                canBeSelected: productCanBeSelected,
                canBeEdited: productCanBeEdited, isEnglish: languageNotifier.isEnglish,
              );
            },);
          },
        );
      } else if (state is Loading)
        return Center(
          child: CircularProgressIndicator(),
        );
      else if (state is Error) return Text(state.error);
      return Container();
    },
  );
}
