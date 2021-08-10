import 'package:ecommerce_admin_tut/src/core/utils/localization/localization_methods.dart';
import 'package:ecommerce_admin_tut/src/res/string_constants.dart';
import 'package:flutter/material.dart';

Widget noCategories(BuildContext context ) {
  return Center(
    child: Container(
      height: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.category,
            color: Colors.grey.shade400,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            getTranslated(context, StringsConstants.noCategoriesAddedYet)!,
            style: TextStyle(color: Colors.grey.shade400),
          )
        ],
      ),
    ),
  );
}
