import 'package:ecommerce_admin_tut/src/core/utils/localization/localization_methods.dart';
import 'package:ecommerce_admin_tut/src/res/string_constants.dart';
import 'package:flutter/material.dart';

Widget noProducts(BuildContext context) {
  return Container(
    height: 150,
    child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.local_grocery_store_outlined,
            color: Colors.grey.shade400,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            getTranslated(context, StringsConstants.noProductsFound)!,
            style: TextStyle(color: Colors.grey.shade400),
          )
        ],
      ),
    ),
  );
}
