import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_admin_tut/src/core/utils/localization/localization_methods.dart';
import 'package:ecommerce_admin_tut/src/core/utils/validator.dart';
import 'package:ecommerce_admin_tut/src/res/string_constants.dart';
import 'package:flutter/material.dart';

editFieldModalBottomSheet({
  required String fieldName,
  required String fieldValue,
  required Function(String name) onSave,
  required BuildContext context,
}) {
  return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
      builder: (context) {
        return EditField(
            fieldName: fieldName, onSave: onSave, fieldValue: fieldValue);
      });
}

class EditField extends StatefulWidget {
  final String fieldName;
  final String fieldValue;
  final Function(String name) onSave;

  EditField(
      {required this.fieldName,
      required this.onSave,
      required this.fieldValue});

  @override
  _EditFieldState createState() => _EditFieldState();
}

class _EditFieldState extends State<EditField> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController? fieldController;

  Validator validator = Validator();
  late StackRouter appRouter;
  late String? Function(String?) validationFunction ;
  late TextDirection textDirection;

  @override
  void initState() {
    setUpTextFieldAttributes();
    super.initState();
  }

  cancelButton() {
    appRouter.pop();
  }

  saveFunction() {
    if (_formKey.currentState!.validate()) {
      widget.onSave(fieldController!.text);
      appRouter.pop();
    }
  }

  void setUpTextFieldAttributes() {
    fieldController = TextEditingController(text: widget.fieldValue);
    fieldController!.selection = TextSelection(
        baseOffset: 0, extentOffset: fieldController!.value.text.length);
    if (widget.fieldName == StringsConstants.arabicName) {
      validationFunction = validator.validateArabicName;
      textDirection = TextDirection.rtl;
    } else{
      validationFunction = validator.validateEnglishName;
      textDirection = TextDirection.ltr;
    }

  }

  @override
  Widget build(BuildContext context) {
    appRouter = AutoRouter.of(context);
    return Container(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 25.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Form(
              key: _formKey,
              child: TextFormField(
                controller: fieldController,
                autofocus: true,
                decoration: InputDecoration(
                  labelText: widget.fieldName,
                  labelStyle: TextStyle(fontSize: 19),
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                validator: validationFunction,
                textDirection: textDirection,
                style: TextStyle(
                  fontFamily: "Poppins",
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: cancelButton,
                    child:
                        Text(getTranslated(context, StringsConstants.cancel)!)),
                TextButton(
                    onPressed: saveFunction,
                    child:
                        Text(getTranslated(context, StringsConstants.save)!)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
