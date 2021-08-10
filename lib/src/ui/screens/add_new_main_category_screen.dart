import 'package:ecommerce_admin_tut/src/core/utils/utils/trim_name.dart';
import 'package:ecommerce_admin_tut/src/ui/common/custom_text_field.dart';
import 'package:ecommerce_admin_tut/src/ui/common/loading_dialogue.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_admin_tut/src/core/utils/localization/localization_methods.dart';
import 'package:ecommerce_admin_tut/src/core/utils/validator.dart';
import 'package:ecommerce_admin_tut/src/di/app_injector.dart';

import 'package:ecommerce_admin_tut/src/models/name_field_model.dart';
import 'package:ecommerce_admin_tut/src/res/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_admin_tut/src/models/main_category_model.dart';
import 'package:ecommerce_admin_tut/src/bloc/main_category_item/main_category_item.dart';

class AddMainCategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    TextEditingController enNameController = TextEditingController();
    TextEditingController arNameController = TextEditingController();
    Validator validator = Validator();
    final GlobalKey<State> _keyLoader = GlobalKey<State>();
    late StackRouter appRouter = AutoRouter.of(context);

    final mainCategoryItemCubit = getItInstance<MainCategoryItemCubit>();
    void submitButtonFunction() async {
      if (_formKey.currentState!.validate()) {
        MainCategoryModel category = MainCategoryModel(
            id: Uuid().v4(),
            name: NameField(
                arabic: TrimName.trimName(arNameController.text),
                english: TrimName.trimName(enNameController.text)),
            mainCategoriesIds: []);
        showLoadingDialog(context, _keyLoader);
        await mainCategoryItemCubit.uploadCategory(category);
        Navigator.of(_keyLoader.currentContext!, rootNavigator: true).pop();
      }
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(
            getTranslated(context, StringsConstants.addNewMainCategory)!,
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.check),
              onPressed: submitButtonFunction,
            )
          ],
        ),
        body: BlocBuilder<MainCategoryItemCubit, MainCategoryItemState>(
          bloc: mainCategoryItemCubit,
          builder: (context, state) {
            if (state is Uploaded) appRouter.pop();
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 10),
              child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomTextField(
                          hintText: StringsConstants.englishName,
                          controller: enNameController,
                          validationFunction: validator.validateEnglishName,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CustomTextField(
                          hintText: StringsConstants.arabicName,
                          controller: arNameController,
                          validationFunction: validator.validateArabicName,
                        ),
                      ],
                    ),
                  )),
            );
          },
        ));
  }
}
