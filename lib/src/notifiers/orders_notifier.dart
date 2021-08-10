import 'package:ecommerce_admin_tut/src/core/utils/order_by_options.dart';
import 'package:ecommerce_admin_tut/src/core/utils/orders_filter_options.dart';
import 'package:ecommerce_admin_tut/src/core/utils/orders_sort_options.dart';
import 'package:flutter/cupertino.dart';

class OrdersNotifier extends ChangeNotifier {
  bool _shouldReload = false;

  OrdersFilterOptions? _filterOption = OrdersFilterOptions.all;
  OrdersSortOptions? _sortOption = OrdersSortOptions.date;
  OrderByOption? _orderByOption = OrderByOption.Descending;

  void reloadOrders() {
    _shouldReload = true;
    notifyListeners();
  }

  void resetFilterAndSortOptions() {
    _filterOption = OrdersFilterOptions.all;
    _sortOption = OrdersSortOptions.date;
    _orderByOption = OrderByOption.Descending;
  }

  void backToDefault() {
    _shouldReload = false;
  }

  setFilterAndSortingOptions(
    OrdersSortOptions sortOption,
    OrdersFilterOptions filterOption,
    OrderByOption orderOption,
  ) {
    _sortOption = sortOption;
    _filterOption = filterOption;
    _orderByOption = orderOption;

    notifyListeners();
  }

  // void controlRadioButton(dynamic value) {
  //   if (value is OrdersSortingOption) {
  //     _controlSortingOptions(value);
  //   } else if (value is OrdersFilterOption) {
  //     _controlFilteringOptions(value);
  //   } else if (value is OrderByOption) _controlOrderingOptions(value);
  // }
  //
  // void _controlSortingOptions(OrdersSortingOption ordersSortingOption) {
  //   sortOption = ordersSortingOption;
  // }
  //
  // void _controlOrderingOptions(OrderByOption orderOption) {
  //   orderByOption = orderOption;
  // }
  //
  // void _controlFilteringOptions(OrdersFilterOption ordersFilterOption) {
  //   filterOption = ordersFilterOption;
  // }

  get shouldReload => _shouldReload;

  get sortOption => _sortOption;

  get filterOption => _filterOption;

  get orderByOption => _orderByOption;
}
