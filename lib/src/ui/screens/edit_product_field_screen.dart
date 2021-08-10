import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_admin_tut/src/core/utils/localization/localization_methods.dart';
import 'package:ecommerce_admin_tut/src/core/utils/utils/trim_name.dart';
import 'package:ecommerce_admin_tut/src/core/utils/validator.dart';
import 'package:ecommerce_admin_tut/src/di/app_injector.dart';
import 'package:ecommerce_admin_tut/src/notifiers/products_notifier.dart';
import 'package:ecommerce_admin_tut/src/res/string_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_admin_tut/src/bloc/product_item/product_item.dart'
    as product_item;
import 'package:flutter/material.dart';

class EditProductFieldScreen extends StatefulWidget {
  final String fieldName;
  final String value;

  EditProductFieldScreen({required this.fieldName, required this.value});

  @override
  _EditProductFieldScreenState createState() => _EditProductFieldScreenState();
}

class _EditProductFieldScreenState extends State<EditProductFieldScreen> {
  final editProductCubit = getItInstance<product_item.ProductItemCubit>();
  TextEditingController fieldController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Validator validator = Validator();
  String? Function(String?)? validationFunction;
  TextInputType? keyBoardType;
  final productsNotifier = getItInstance<ProductsNotifier>();

  void submitFunction() {
    print('name is ${widget.fieldName} && value is ${fieldController.text}');
    if (_formKey.currentState!.validate()) {
      String fieldVal;
      if (widget.fieldName == StringsConstants.arabicName ||
          widget.fieldName == StringsConstants.englishName ||
          widget.fieldName == StringsConstants.englishDescription ||
          widget.fieldName == StringsConstants.arabicDescription)
        fieldVal = TrimName.trimName(fieldController.text);
      else
        fieldVal = fieldController.text;

      editProductCubit.updateProductField(
          fieldName: widget.fieldName, value: fieldVal);
    }
  }

  @override
  void initState() {
    setUpTextFieldAttributes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    StackRouter appRouter = AutoRouter.of(context);
    fieldController = TextEditingController(text: widget.value);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.fieldName),
        actions: [
          IconButton(onPressed: submitFunction, icon: Icon(Icons.done))
        ],
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Form(
                  key: _formKey,
                  child: TextFormField(
                    maxLines: 6,
                    minLines: 1,
                    autofocus: true,
                    controller: fieldController,
                    decoration: InputDecoration(
                      hintText: widget.fieldName,
                      labelText: widget.fieldName,
                      labelStyle: TextStyle(fontSize: 19),
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      //fillColor: Colors.green
                    ),
                    validator: validationFunction,
                    keyboardType: keyBoardType,
                    style: TextStyle(
                      fontFamily: "Poppins",
                    ),
                  ),
                ),
              ),
              BlocBuilder<product_item.ProductItemCubit,
                  product_item.ProductItemState>(
                bloc: editProductCubit,
                builder: (context, state) {
                  if (state is product_item.Loading)
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  else if (state is product_item.FieldUpdated) appRouter.pop();
                  return Container();
                },
              ),
            ],
          ),
          BlocBuilder<product_item.ProductItemCubit,
                  product_item.ProductItemState>(
              bloc: editProductCubit,
              builder: (context, state) {
                return state is product_item.FieldError
                    ? Text(
                        getTranslated(context, state.error)!,
                        style: TextStyle(color: Colors.red),
                      )
                    : Container();
              }),
        ],
      ),
    );
  }

  void setUpTextFieldAttributes() {
    switch (widget.fieldName) {
      case StringsConstants.arabicName:
        validationFunction = validator.validateArabicName;
        keyBoardType = TextInputType.name;
        break;
      case StringsConstants.englishName:
        validationFunction = validator.validateEnglishName;
        keyBoardType = TextInputType.name;
        break;
      case StringsConstants.englishDescription:
        // validationFunction = validator.v;
        keyBoardType = TextInputType.name;
        break;

      case StringsConstants.arabicDescription:
        // validationFunction = validator.v;
        keyBoardType = TextInputType.name;
        break;

      case StringsConstants.quantity:
        validationFunction = validator.validateQuantity;
        keyBoardType = TextInputType.number;
        break;

      case StringsConstants.currentPrice:
        validationFunction = validator.validatePrice;
        keyBoardType = TextInputType.number;
        break;
      case StringsConstants.discountPrice:
        validationFunction = validator.validatePrice;
        keyBoardType = TextInputType.number;
        break;
    }
  }
}
