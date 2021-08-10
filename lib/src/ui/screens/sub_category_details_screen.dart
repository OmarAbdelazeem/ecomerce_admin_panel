import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_admin_tut/src/core/utils/confirmation_dialogue_options.dart';
import 'package:ecommerce_admin_tut/src/core/utils/localization/localization_methods.dart';
import 'package:ecommerce_admin_tut/src/core/utils/utils/trim_name.dart';
import 'package:ecommerce_admin_tut/src/di/app_injector.dart';
import 'package:ecommerce_admin_tut/src/models/sub_category_model.dart';
import 'package:ecommerce_admin_tut/src/notifiers/sub_categories_notifier.dart';
import 'package:ecommerce_admin_tut/src/res/string_constants.dart';
import 'package:ecommerce_admin_tut/src/ui/common/confirmation_dialogue.dart';
import 'package:ecommerce_admin_tut/src/ui/common/edit_field_modal_bottom_sheet.dart';
import 'package:ecommerce_admin_tut/src/ui/common/field_name.dart';
import 'package:ecommerce_admin_tut/src/ui/common/loading_dialogue.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_admin_tut/src/bloc/sub_category_item/sub_category_item.dart'
    as sub_category_item;
import 'package:flutter_bloc/flutter_bloc.dart';

class SubCategoryDetailsScreen extends StatefulWidget {
  final SubCategoryModel subCategory;

  SubCategoryDetailsScreen(this.subCategory);

  @override
  _SubCategoryDetailsScreenState createState() => _SubCategoryDetailsScreenState();
}

class _SubCategoryDetailsScreenState extends State<SubCategoryDetailsScreen> {
  late TextEditingController enNameController;
  late TextEditingController arNameController;
  final subCategoryItemCubit =
      getItInstance<sub_category_item.SubCategoryItemCubit>();
  late StackRouter appRouter;
  final GlobalKey<State> _keyLoader = GlobalKey<State>();
  @override
  void initState() {
    enNameController =
        TextEditingController(text: widget.subCategory.name.english);
    arNameController =
        TextEditingController(text: widget.subCategory.name.arabic);
    super.initState();
  }

  onNameFieldPressed(
      TextEditingController fieldController, String fieldName, bool isEnglish) {
    updateSubCategoryNameFunction(String name) {
      subCategoryItemCubit.updateSubCategoryName(
          name: TrimName.trimName(name), id: widget.subCategory.id, isEnglishName: isEnglish);
    }

    editFieldModalBottomSheet(
        fieldName: fieldName,
        onSave: updateSubCategoryNameFunction,
        fieldValue: fieldController.text,
        context: context);
  }

  void deleteSubCategory() async{
    Future.delayed(Duration(milliseconds: 1)).then((value) => showLoadingDialog(context, _keyLoader));
   await subCategoryItemCubit.deleteSubCategory(widget.subCategory.id);
  }

  void closeDeletingDialogue(){
    Navigator.of(_keyLoader.currentContext!, rootNavigator: true).pop();
  }
  @override
  Widget build(BuildContext context) {
    appRouter = AutoRouter.of(context);
    return Scaffold(
      appBar: AppBar(
        title: BlocConsumer<sub_category_item.SubCategoryItemCubit,
            sub_category_item.SubCategoryItemState>(
          bloc: subCategoryItemCubit,
          listener: (context, state) {
            state.when(
              imageClosed: (){},
              idle: () {},
              loading: () {},
              enNameEdited: (enName) {
                enNameController.text = enName;
                SubCategoryModel section = widget.subCategory;
                section.name.english = enName;
              },
              arNameEdited: (arName) {
                arNameController.text = arName;
                SubCategoryModel section = widget.subCategory;
                section.name.arabic = arName;
              },
              error: (e) {},
              imagePicked: (imageFile) {},
              imageUpdated: (image) {
              },
              subCategoryUploaded: (_) {},
              deleted: () {
                closeDeletingDialogue();
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
          builder: (context, state) {
            return Text(enNameController.text);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () async {
              await showConfirmationDialogue(
                  confirmationDialogueChoice: ConfirmationDialogueOptions.deleteSubCategory, yesFunction: deleteSubCategory, context: context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Card(
              elevation: 2,
              child: Container(
                child: Stack(
                  children: [
                    BlocBuilder<sub_category_item.SubCategoryItemCubit,
                        sub_category_item.SubCategoryItemState>(
                      bloc: subCategoryItemCubit,
                      builder: (BuildContext context, state) {
                        return CachedNetworkImage(
                          height: 230,
                          imageUrl: state is sub_category_item.ImageUpdated
                              ? state.image
                              : widget.subCategory.image!,
                        );
                      },
                    ),
                    Positioned.fill(
                      right: 5,
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.blue.shade300,
                          child: IconButton(
                            onPressed: addImageIcon,
                            icon: Icon(
                              Icons.add_a_photo_sharp,
                              size: 30,
                              color: Colors.white,
                            ),
                            // color: Colors.blue.shade400,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            BlocBuilder<sub_category_item.SubCategoryItemCubit,
                sub_category_item.SubCategoryItemState>(
              bloc: subCategoryItemCubit,
              builder: (context, state) {
                return InkWell(
                  onTap: () {
                    onNameFieldPressed(
                        enNameController, StringsConstants.englishName, true);
                  },
                  child: FieldName(
                    icon: Icon(
                      Icons.title,
                      color: Colors.grey,
                    ),
                    fieldName: StringsConstants.englishName,
                    fieldValue: enNameController.text,
                  ),
                );
              },
            ),
            SizedBox(
              height: 10,
            ),
            BlocBuilder<sub_category_item.SubCategoryItemCubit,
                sub_category_item.SubCategoryItemState>(
              bloc: subCategoryItemCubit,
              builder: (context, state) {
                return InkWell(
                  onTap: () {
                    onNameFieldPressed(
                        arNameController, StringsConstants.arabicName, false);
                  },
                  child: FieldName(
                    icon: Icon(
                      Icons.title,
                      color: Colors.grey,
                    ),
                    fieldName: StringsConstants.arabicName,
                    fieldValue: arNameController.text,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  addImageIcon() {
    subCategoryItemCubit.pickAndUpdateImage(widget.subCategory.id);
  }
}
