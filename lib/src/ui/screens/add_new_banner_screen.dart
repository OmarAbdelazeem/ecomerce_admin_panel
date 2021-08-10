import 'dart:io';
import 'package:ecommerce_admin_tut/src/core/utils/utils/trim_name.dart';
import 'package:ecommerce_admin_tut/src/ui/common/add_image.dart';
import 'package:ecommerce_admin_tut/src/ui/common/custom_text_field.dart';
import 'package:ecommerce_admin_tut/src/ui/common/loading_dialogue.dart';
import 'package:uuid/uuid.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_admin_tut/src/core/utils/localization/localization_methods.dart';
import 'package:ecommerce_admin_tut/src/core/utils/validator.dart';
import 'package:ecommerce_admin_tut/src/di/app_injector.dart';
import 'package:ecommerce_admin_tut/src/models/banner_model.dart';
import 'package:ecommerce_admin_tut/src/models/name_field_model.dart';
import 'package:ecommerce_admin_tut/src/res/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_admin_tut/src/bloc/banner_item/banner_item.dart'
    as banner_item;
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNewBannerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bannerItemCubit = getItInstance<banner_item.BannerItemCubit>();
    final appRouter = AutoRouter.of(context);
    Validator validator = Validator();
    final formKey = GlobalKey<FormState>();
    final GlobalKey<State> _keyLoader = GlobalKey<State>();
    TextEditingController enNameController = TextEditingController();
    TextEditingController arNameController = TextEditingController();
    File? imageFile;

    void submitButtonFunction() async {
      if (formKey.currentState!.validate()) {
        if (imageFile == null) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(getTranslated(
                  context, StringsConstants.youMustProvideAnImage)!)));
        } else {
          BannerModel banner = BannerModel(
              name: NameField(
                english: TrimName.trimName(enNameController.text),
                arabic: TrimName.trimName(arNameController.text),
              ),
              id: Uuid().v4());
          showLoadingDialog(context, _keyLoader);
          await bannerItemCubit.uploadBanner(banner, imageFile!);
          Navigator.of(_keyLoader.currentContext!, rootNavigator: true).pop();
        }
      }
    }

    void clearFieldsAndPop() {
      enNameController.clear();
      arNameController.clear();
      imageFile = null;
      appRouter.pop();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          getTranslated(context, StringsConstants.addNewBanner)!,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: submitButtonFunction,
          )
        ],
      ),
      body:
          BlocBuilder<banner_item.BannerItemCubit, banner_item.BannerItemState>(
              bloc: bannerItemCubit,
              builder: (BuildContext context, state) {
                if (state is banner_item.ImagePicked)
                  imageFile = state.pickedImage;
                else if (state is banner_item.ImageClosed)
                  imageFile = null;
                else if (state is banner_item.BannerUploaded)
                  clearFieldsAndPop();
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Form(
                      key: formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            AddImage(
                              imageFile: imageFile,
                              closeImageFunction: bannerItemCubit.closeImage,
                              pickImageFunction: bannerItemCubit.pickImage,
                            ),
                            SizedBox(
                              height: 60,
                            ),
                            CustomTextField(
                              hintText: StringsConstants.englishName,
                              controller: enNameController,
                              validationFunction: validator.validateEnglishName,
                            ),
                            SizedBox(
                              height: 20,
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
              }),
    );
  }
}
