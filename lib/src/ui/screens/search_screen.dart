import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_admin_tut/src/bloc/customers/customers.dart'
    as customers;
import 'package:ecommerce_admin_tut/src/bloc/orders/orders.dart';
import 'package:ecommerce_admin_tut/src/bloc/products/products.dart'
    as products;
import 'package:ecommerce_admin_tut/src/core/utils/localization/localization_methods.dart';
import 'package:ecommerce_admin_tut/src/di/app_injector.dart';
import 'package:ecommerce_admin_tut/src/res/app_colors.dart';
import 'package:ecommerce_admin_tut/src/res/string_constants.dart';
import 'package:ecommerce_admin_tut/src/res/text_styles.dart';
import 'package:ecommerce_admin_tut/src/ui/common/customers_builder.dart';
import 'package:ecommerce_admin_tut/src/ui/common/orders_builder.dart';
import 'package:ecommerce_admin_tut/src/ui/common/products_builder.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  final String? screenTitle;

  SearchScreen(this.screenTitle);


  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final customersCubit = getItInstance<customers.CustomersCubit>();
  final productsCubit = getItInstance<products.ProductsCubit>();
  final ordersCubit = getItInstance<OrdersCubit>();

  late String hintText;

  late Function searchFunction;
  late Widget content;
  late TextInputType keyBoardType;

  @override
  Widget build(BuildContext context) {
    checkScreen();
    return Scaffold(
      appBar: CommonSearchBar(
        searchFunction: searchFunction,
        hintText: hintText,
        keyBoardType: keyBoardType,
      ),
      body: Container(
          height: MediaQuery.of(context).size.height * 0.8, child: content),
    );
  }

  void checkScreen() {
    // ignore: missing_enum_constant_in_switch
    switch (widget.screenTitle) {
      case StringsConstants.customers:
        hintText = getTranslated(context, StringsConstants.customerName)!;
        searchFunction = customersCubit.searchForCustomer;
        content = customersDataBuilder(customersCubit);
        keyBoardType = TextInputType.text;

        break;
      case StringsConstants.orders:
        hintText = getTranslated(context, StringsConstants.orderNumber)!;
        searchFunction = ordersCubit.searchForOrder;
        content = ordersDataBuilder(ordersCubit: ordersCubit);
        keyBoardType = TextInputType.number;
        break;
      case StringsConstants.products:
        hintText = getTranslated(context, StringsConstants.productName)!;
        searchFunction = productsCubit.searchForProduct;
        content = productsDataBuilder(
            productsCubit: productsCubit, productCanBeEdited: true);
        keyBoardType = TextInputType.name;
        break;
    }
  }
}

class CommonSearchBar extends StatefulWidget implements PreferredSizeWidget {
  // final ValueChanged<String> onTextChanged;
  final VoidCallback? onBackPressed;
  final VoidCallback? onClosePressed;
  final String? hintText;
  final searchFunction;
  final keyBoardType;

  CommonSearchBar(
      {
      // @required this.onTextChanged,
      required this.hintText,
      this.onBackPressed,
      required this.keyBoardType,
      @required this.searchFunction,
      this.onClosePressed});

  @override
  _CommonSearchBarState createState() => _CommonSearchBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _CommonSearchBarState extends State<CommonSearchBar> {
  FocusNode focusNode = FocusNode();
  TextEditingController textEditingController = TextEditingController();
  bool showCross = false;
  late StackRouter appRouter;

  @override
  Widget build(BuildContext context) {
    appRouter = AutoRouter.of(context);
    return AppBar(
      title: TextField(
        controller: textEditingController,
        autofocus: true,
        focusNode: focusNode,
        keyboardType: widget.keyBoardType,
        onChanged: (value) {
          widget.searchFunction(textEditingController.text);
            print('search name is ${textEditingController.text}');
          if (textEditingController.text.length > 0) {

            setState(() {
              showCross = true;
            });
          } else {
            setState(() {
              showCross = false;
            });
          }
        },
        decoration: InputDecoration(
            hintText: widget.hintText,
            // Theme.of(context).inputDecorationTheme.hintStyle
            contentPadding: EdgeInsets.only(top: 25),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Icon(
                Icons.search,
                color: AppColors.black,
              ),
            ),
            suffixIcon: Visibility(
                visible: showCross,
                child: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      if (textEditingController.text == "") {
                        if (widget.onClosePressed != null) {
                          widget.onClosePressed!();
                        }
                        appRouter.pop();
                      } else {
                        textEditingController.clear();
                        // widget.onTextChanged("");
                      }
                    })),
            fillColor: AppColors.colorF6F5F8,
            filled: true,
            hintStyle: AppTextStyles.normal16Color8E8E92,
            focusColor: AppColors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: AppColors.white, width: 0.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: AppColors.white, width: 0.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: AppColors.white, width: 0.0),
            )),
      ),
    );
  }
}
