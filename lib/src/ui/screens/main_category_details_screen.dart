import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_admin_tut/src/bloc/sub_categories/sub_categories.dart'
    as sub_categories;
import 'package:ecommerce_admin_tut/src/bloc/main_category_item/main_category_item.dart'
    as main_category_item;
import 'package:ecommerce_admin_tut/src/bloc/sub_category_item/sub_category_item.dart'
    as sub_category_item;
import 'package:ecommerce_admin_tut/src/core/utils/confirmation_dialogue_options.dart';
import 'package:ecommerce_admin_tut/src/core/utils/localization/localization_methods.dart';
import 'package:ecommerce_admin_tut/src/core/utils/utils/trim_name.dart';
import 'package:ecommerce_admin_tut/src/core/utils/validator.dart';
import 'package:ecommerce_admin_tut/src/di/app_injector.dart';
import 'package:ecommerce_admin_tut/src/models/main_category_model.dart';
import 'package:ecommerce_admin_tut/src/models/name_field_model.dart';
import 'package:ecommerce_admin_tut/src/models/sub_category_model.dart';
import 'package:ecommerce_admin_tut/src/notifiers/main_categories_notifier.dart';
import 'package:ecommerce_admin_tut/src/notifiers/provider_notifier.dart';
import 'package:ecommerce_admin_tut/src/notifiers/sub_categories_notifier.dart';
import 'package:ecommerce_admin_tut/src/res/string_constants.dart';
import 'package:ecommerce_admin_tut/src/ui/common/confirmation_dialogue.dart';
import 'package:ecommerce_admin_tut/src/ui/common/edit_field_modal_bottom_sheet.dart';
import 'package:ecommerce_admin_tut/src/ui/common/field_name.dart';
import 'package:ecommerce_admin_tut/src/routes/router.gr.dart';
import 'package:ecommerce_admin_tut/src/ui/common/loading_dialogue.dart';
import 'package:ecommerce_admin_tut/src/ui/common/sub_categories_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

class MainCategoryDetailsScreen extends StatefulWidget {
  final MainCategoryModel mainCategory;

  MainCategoryDetailsScreen(this.mainCategory);

  @override
  _MainCategoryDetailsScreenState createState() => _MainCategoryDetailsScreenState();
}

class _MainCategoryDetailsScreenState extends State<MainCategoryDetailsScreen> {
  final mainCategoryItemCubit = getItInstance<main_category_item.MainCategoryItemCubit>();

  final subcategoriesCubit = getItInstance<sub_categories.SubCategoriesCubit>();

  late TextEditingController enNameController;
  late TextEditingController arNameController;

  Validator validator = Validator();
  final GlobalKey<State> _keyLoader = GlobalKey<State>();
  late StackRouter appRouter;

  @override
  void initState() {
    subcategoriesCubit.fetchSubCategories(widget.mainCategory.id);
    enNameController =
        TextEditingController(text: widget.mainCategory.name.english);
    arNameController =
        TextEditingController(text: widget.mainCategory.name.arabic);
    super.initState();
  }

  void deleteMainCategory() {
    Future.delayed(Duration(milliseconds: 1)).then((value) => showLoadingDialog(context ,_keyLoader));
    mainCategoryItemCubit.deleteMainCategory(widget.mainCategory.id);
  }

  void closeLoadingDialogue(){
    Navigator.of(_keyLoader.currentContext!, rootNavigator: true).pop();
  }


  onFieldPressed(
      {required TextEditingController fieldController,required String fieldName,required bool isEnglish}) {
    updateMainCategoryNameFunction(String name) {
      mainCategoryItemCubit.updateCategoryName(
          name: TrimName.trimName(name),
          id: widget.mainCategory.id,
          isEnglish:  isEnglish);
    }

    editFieldModalBottomSheet(
        fieldName: fieldName,
        onSave: updateMainCategoryNameFunction,
        fieldValue: fieldController.text,
        context: context);
  }



  @override
  Widget build(BuildContext context) {
    appRouter = AutoRouter.of(context);
    return Scaffold(
      appBar: AppBar(
        title: BlocConsumer<main_category_item.MainCategoryItemCubit,
            main_category_item.MainCategoryItemState>(
          bloc: mainCategoryItemCubit,
          listener:
              (BuildContext context, main_category_item.MainCategoryItemState state) {
            state.when(
              error: (_) {},
              uploaded: (_) {},
              idle: () {},
              loading: () {},
              enNameEdited: (enName) {
                enNameController.text = enName;
                widget.mainCategory.name.english = enName;
              },
              arNameEdited: (arName){
                arNameController.text = arName;
                widget.mainCategory.name.arabic = arName;
              },
              editing: () {},
              deleted: () {
                closeLoadingDialogue();
                appRouter.pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(getTranslated(context,
                        StringsConstants.categoryDeletedSuccessfully)!),
                  ),
                );
              },
            );
          },
          builder:
              (BuildContext context, main_category_item.MainCategoryItemState state) {
            return Text(enNameController.text);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () async {
              await showConfirmationDialogue(
                  confirmationDialogueChoice: ConfirmationDialogueOptions.deleteMainCategory, yesFunction: deleteMainCategory, context: context);
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          appRouter.push(
              AddNewSubCategoryScreen(mainCategoryId: widget.mainCategory.id));
        },
      ),
      body: Padding(
          padding: const EdgeInsets.only(left: 25, top: 15, right: 20),
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: (){onFieldPressed(fieldController: enNameController ,isEnglish: true,fieldName: StringsConstants.englishName);},
                            child: BlocBuilder<main_category_item.MainCategoryItemCubit,
                                main_category_item.MainCategoryItemState>(
                              bloc: mainCategoryItemCubit,
                              builder: (context, state) {
                                return FieldName(
                                    icon: Icon(
                                      Icons.title,
                                      color: Colors.grey,
                                    ),
                                    fieldName: StringsConstants.englishName,
                                    fieldValue: enNameController.text,
                                   );
                              },
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          InkWell(
                            onTap: (){onFieldPressed(fieldController: arNameController ,isEnglish: false,fieldName: StringsConstants.arabicName);},
                            child: BlocBuilder<main_category_item.MainCategoryItemCubit,
                                main_category_item.MainCategoryItemState>(
                              bloc: mainCategoryItemCubit,
                              builder: (context, state) {
                                return FieldName(
                                    icon: Icon(
                                      Icons.title,
                                      color: Colors.grey,
                                    ),
                                    fieldName: StringsConstants.arabicName,
                                    fieldValue: arNameController.text,);
                              },
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(getTranslated(
                              context, StringsConstants.subCategories)!),
                          SizedBox(
                            height: 15,
                          ),
                          ProviderNotifier(child:
                              (SubCategoriesNotifier subCategoriesNotifier) {
                            if (subCategoriesNotifier.isSubCategoryRemoved) {
                              subcategoriesCubit.removeSubCategoryLocally(
                                  subCategoriesNotifier.subCategory);
                              subCategoriesNotifier.backToDefault();
                            } else if (subCategoriesNotifier
                                .isNewSubCategoryAdded) {
                              subcategoriesCubit.addNewSubCategoryLocally(
                                  subCategoriesNotifier.subCategory);
                              subCategoriesNotifier.backToDefault();
                            }

                            return SubCategoriesBuilder(subcategoriesCubit);
                          })
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
