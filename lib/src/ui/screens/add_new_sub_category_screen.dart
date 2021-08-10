import 'dart:io';
import 'package:ecommerce_admin_tut/src/core/utils/utils/trim_name.dart';
import 'package:ecommerce_admin_tut/src/models/sub_category_model.dart';
import 'package:ecommerce_admin_tut/src/ui/common/add_image.dart';
import 'package:ecommerce_admin_tut/src/ui/common/custom_text_field.dart';
import 'package:ecommerce_admin_tut/src/ui/common/loading_dialogue.dart';
import 'package:uuid/uuid.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_admin_tut/src/core/utils/localization/localization_methods.dart';
import 'package:ecommerce_admin_tut/src/core/utils/validator.dart';
import 'package:ecommerce_admin_tut/src/di/app_injector.dart';
import 'package:ecommerce_admin_tut/src/bloc/sub_category_item/sub_category_item.dart'
    as sub_category_item;
import 'package:ecommerce_admin_tut/src/models/name_field_model.dart';
import 'package:ecommerce_admin_tut/src/res/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNewSubCategoryScreen extends StatelessWidget {
  final String mainCategoryId;

  AddNewSubCategoryScreen({required this.mainCategoryId});

  @override
  Widget build(BuildContext context) {
    Validator validator = Validator();
    final subCategoryItemCubit =
        getItInstance<sub_category_item.SubCategoryItemCubit>();
    TextEditingController enNameController = TextEditingController();
    TextEditingController arNameController = TextEditingController();
    File? imageFile;
    late StackRouter appRouter = AutoRouter.of(context);
    final _formKey = GlobalKey<FormState>();
    final GlobalKey<State> _keyLoader = GlobalKey<State>();

    void submitButtonFunction() async {
      if (imageFile == null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(getTranslated(
                context, StringsConstants.youMustProvideAnImage)!)));
      } else {
        if (_formKey.currentState!.validate()) {
          SubCategoryModel subCategory = SubCategoryModel(
              name: NameField(
                english: TrimName.trimName(enNameController.text),
                arabic: TrimName.trimName(arNameController.text),
              ),
              mainCategoryId: mainCategoryId,
              id: Uuid().v4());
          showLoadingDialog(context, _keyLoader);
          await subCategoryItemCubit.uploadSubCategory(subCategory, imageFile!);
          Navigator.of(_keyLoader.currentContext!, rootNavigator: true).pop();
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          getTranslated(context, StringsConstants.addNewSubCategory)!,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: submitButtonFunction,
          )
        ],
      ),
      body: BlocBuilder<sub_category_item.SubCategoryItemCubit,
          sub_category_item.SubCategoryItemState>(
        bloc: subCategoryItemCubit,
        builder: (BuildContext context, state) {
          if (state is sub_category_item.ImagePicked)
            imageFile = state.image;
          else if (state is sub_category_item.ImageClosed)
            imageFile = null;
          else if (state is sub_category_item.SubCategoryUploaded)
            appRouter.pop();

          return Padding(
            padding: const EdgeInsets.all(12),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  AddImage(
                    imageFile: imageFile,
                    pickImageFunction: subCategoryItemCubit.pickImage,
                    closeImageFunction: subCategoryItemCubit.closeImage,
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
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
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
