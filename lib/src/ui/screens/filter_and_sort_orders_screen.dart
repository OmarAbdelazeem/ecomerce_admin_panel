import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_admin_tut/src/core/utils/localization/localization_methods.dart';
import 'package:ecommerce_admin_tut/src/core/utils/order_by_options.dart';
import 'package:ecommerce_admin_tut/src/core/utils/orders_filter_options.dart';
import 'package:ecommerce_admin_tut/src/core/utils/orders_sort_options.dart';
import 'package:ecommerce_admin_tut/src/di/app_injector.dart';
import 'package:ecommerce_admin_tut/src/notifiers/orders_notifier.dart';
import 'package:ecommerce_admin_tut/src/res/string_constants.dart';
import 'package:flutter/material.dart';

class FilterAndSortingOrdersScreen extends StatefulWidget {
  @override
  _FilterAndSortingOrdersScreenState createState() =>
      _FilterAndSortingOrdersScreenState();
}

class _FilterAndSortingOrdersScreenState
    extends State<FilterAndSortingOrdersScreen> {
  late StackRouter appRouter;
  final ordersNotifier = getItInstance<OrdersNotifier>();
  OrdersSortOptions? sortOption;
  OrderByOption? orderByOption;
  OrdersFilterOptions? filterOption;

  void doneButtonFunction() {
    ordersNotifier.setFilterAndSortingOptions(
      sortOption!,
      filterOption!,
      orderByOption!,
    );
    appRouter.pop();
    ordersNotifier.reloadOrders();
  }

  resetFilterAndSorting() {
    setState(() {
      filterOption = OrdersFilterOptions.all;
      sortOption = OrdersSortOptions.date;
      orderByOption = OrderByOption.Descending;
    });
  }

  @override
  void initState() {
    filterOption = ordersNotifier.filterOption ;
    sortOption = ordersNotifier.sortOption ;
    orderByOption = ordersNotifier.orderByOption;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    appRouter = AutoRouter.of(context);
    return WillPopScope(
      onWillPop: () async {
        resetFilterAndSorting();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
              getTranslated(context, StringsConstants.filteringAndSorting)!),
          actions: [
            IconButton(
              onPressed: showResetConfirmationDialogue,
              icon: Icon(Icons.refresh),
            ),
            IconButton(
              onPressed: doneButtonFunction,
              icon: Icon(Icons.done),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      getTranslated(context, StringsConstants.filterBy)!,
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  radioButton(
                      title: StringsConstants.all,
                      value: OrdersFilterOptions.all,
                      initialValue: filterOption),
                  radioButton(
                      title: StringsConstants.processing,
                      value: OrdersFilterOptions.processing,
                      initialValue: filterOption),
                  radioButton(
                    title: StringsConstants.delivering,
                    value: OrdersFilterOptions.delivering,
                    initialValue: filterOption,
                  ),
                  radioButton(
                    title: StringsConstants.delivered,
                    value: OrdersFilterOptions.delivered,
                    initialValue: filterOption,
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      getTranslated(context, StringsConstants.sortBy)!,
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  radioButton(
                      title: StringsConstants.date,
                      value: OrdersSortOptions.date,
                      initialValue: sortOption),
                  radioButton(
                    title: StringsConstants.total,
                    value: OrdersSortOptions.total,
                    initialValue: sortOption,
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      getTranslated(context, StringsConstants.orderBy)!,
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  radioButton(
                      title: StringsConstants.descending,
                      value: OrderByOption.Descending,
                      initialValue: orderByOption),
                  radioButton(
                      title: StringsConstants.ascending,
                      value: OrderByOption.Ascending,
                      initialValue: orderByOption),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  radioButton(
      {required String title,
      required dynamic value,
      required dynamic initialValue}) {
    return InkWell(
      onTap: () {
        onRadioChanged(value);
      },
      child: ListTile(
        title: Text(getTranslated(context, title)!),
        leading: Radio(
          value: value,
          groupValue: initialValue,
          onChanged: onRadioChanged,
        ),
      ),
    );
  }

  void onRadioChanged(dynamic value) {
    setState(() {
      controlRadioButton(value);
    });
  }

  void controlRadioButton(dynamic value) {
    if (value is OrdersSortOptions) {
      _controlSortingOptions(value);
    } else if (value is OrdersFilterOptions) {
      _controlFilteringOptions(value);
    } else if (value is OrderByOption) _controlOrderingOptions(value);
  }

  void _controlSortingOptions(OrdersSortOptions ordersSortingOption) {
    sortOption = ordersSortingOption;
  }

  void _controlOrderingOptions(OrderByOption orderOption) {
    orderByOption = orderOption;
  }

  void _controlFilteringOptions(OrdersFilterOptions ordersFilterOption) {
    filterOption = ordersFilterOption;
  }

  Future showResetConfirmationDialogue() {
    return showDialog<bool>(
        context: context,
        builder: (dialogueContext) {
          return AlertDialog(
            title: Text(getTranslated(
                context, StringsConstants.resetFilteringAndSorting)!),
            content: Text(getTranslated(
                context, StringsConstants.resetFilteringAndSortingMessage)!),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(dialogueContext);
                  },
                  child: Text(getTranslated(context, StringsConstants.no)!)),
              TextButton(
                  onPressed: () {
                    resetFilterAndSorting();
                    ordersNotifier.resetFilterAndSortOptions();
                    Navigator.pop(dialogueContext);
                  },
                  child: Text(getTranslated(context, StringsConstants.yes)!))
            ],
          );
        });
  }
}
