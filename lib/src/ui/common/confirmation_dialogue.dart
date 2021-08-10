import 'package:ecommerce_admin_tut/src/core/utils/confirmation_dialogue_options.dart';
import 'package:ecommerce_admin_tut/src/core/utils/localization/localization_methods.dart';
import 'package:ecommerce_admin_tut/src/res/string_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void> showConfirmationDialogue(
    { required ConfirmationDialogueOptions confirmationDialogueChoice,
      required void Function() yesFunction,
      required BuildContext context}) async {
  late String dialogueTitle;
  late String dialogueContent;

  void checkDeletingType() {
    switch (confirmationDialogueChoice) {
      case ConfirmationDialogueOptions.deleteProduct:
        dialogueTitle = StringsConstants.deleteProduct;
        dialogueContent = StringsConstants.deleteProductConfirmation;
        break;
      case ConfirmationDialogueOptions.deleteSubCategory:
        dialogueTitle = StringsConstants.deleteSubCategory;
        dialogueContent = StringsConstants.deleteSubCategoryConfirmation;
        break;
      case ConfirmationDialogueOptions.deleteBanner:
        dialogueTitle = StringsConstants.deleteBanner;
        dialogueContent = StringsConstants.deleteBannerConfirmation;
        break;
      case ConfirmationDialogueOptions.deleteMainCategory:
        dialogueTitle = StringsConstants.deleteMainCategory;
        dialogueContent = StringsConstants.deleteMainCategoryConfirmation;
        break;

      case ConfirmationDialogueOptions.changeCategory:
        dialogueTitle = StringsConstants.deleteProduct;
        dialogueContent = StringsConstants.changeCategoryConfirmation;
        break;
    }
  }

  return showDialog(
      context: context,
      builder: (BuildContext context) {
        checkDeletingType();
        return AlertDialog(
          title: Text(getTranslated(context, dialogueTitle)!),
          content: Text(getTranslated(context, dialogueContent)!),
          actions: [
            TextButton(
                onPressed: () async {
                  yesFunction();
                  Navigator.pop(context);
                },
                child: Text(getTranslated(context, StringsConstants.yes)!)),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(getTranslated(context, StringsConstants.no)!)),
          ],
        );
      });
}
