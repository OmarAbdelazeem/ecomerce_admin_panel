import 'package:ecommerce_admin_tut/src/models/sub_category_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubCategoryItem extends StatelessWidget {
  final SubCategoryModel subCategory;
  final void Function()? onTap;
  final bool isEnglish;
  SubCategoryItem({required this.subCategory,this.onTap ,required this.isEnglish});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            children: [
              Card(
                child: Image.network(
                  subCategory.image!,
                  height:  70 ,
                  width:  70 ,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(isEnglish ? subCategory.name.english : subCategory.name.arabic,style: TextStyle(fontSize: 17),)
            ],
          ),
        ),
      );
  }
}
