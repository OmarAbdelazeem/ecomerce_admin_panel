import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_admin_tut/src/bloc/orders/orders.dart';
import 'package:ecommerce_admin_tut/src/core/utils/localization/localization_methods.dart';
import 'package:ecommerce_admin_tut/src/core/utils/order_by_options.dart';
import 'package:ecommerce_admin_tut/src/core/utils/orders_filter_options.dart';
import 'package:ecommerce_admin_tut/src/core/utils/orders_sort_options.dart';
import 'package:ecommerce_admin_tut/src/core/utils/utils/date_time_util.dart';
import 'package:ecommerce_admin_tut/src/di/app_injector.dart';
import 'package:ecommerce_admin_tut/src/models/basic_order_model.dart';
import 'package:ecommerce_admin_tut/src/models/order_model.dart';
import 'package:ecommerce_admin_tut/src/notifiers/orders_notifier.dart';
import 'package:ecommerce_admin_tut/src/notifiers/provider_notifier.dart';
import 'package:ecommerce_admin_tut/src/repository/firestore_repository.dart';
import 'package:ecommerce_admin_tut/src/res/string_constants.dart';
import 'package:ecommerce_admin_tut/src/res/text_styles.dart';
import 'package:ecommerce_admin_tut/src/ui/common/orders_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_admin_tut/src/routes/router.gr.dart';

// import '../order_details_screen.dart';

class OrdersScreen extends StatefulWidget {
  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen>
    with AutomaticKeepAliveClientMixin {
  late StackRouter appRouter;
  final ordersCubit = getItInstance<OrdersCubit>();
  final ordersNotifierInstance = getItInstance<OrdersNotifier>();

  DateTime? currentDate;

  @override
  void initState() {
    ordersCubit.fetchOrders();
    // TODO: implement initState
    super.initState();
  }

  void fetchOrders() {
    ordersCubit.fetchOrders(
        orderStatusOption: ordersNotifierInstance.filterOption,
        orderOption: ordersNotifierInstance.orderByOption,
        date: currentDate,
        ordersSortingOptions: ordersNotifierInstance.sortOption);
  }

  @override
  Widget build(BuildContext context) {
    appRouter = AutoRouter.of(context);
    return ProviderNotifier(
      child: (OrdersNotifier ordersProvider) {
        if (ordersProvider.shouldReload) {
          fetchOrders();
          ordersProvider.backToDefault();
        }
        return Column(
          children: [
            filterByDate(),
            Container(
                height: MediaQuery.of(context).size.height * 0.8,
                child: ordersDataBuilder(ordersCubit: ordersCubit))
          ],
        );
      },
    );
  }

  Widget filterByDate() {
    return Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Row(
          children: [
            TextButton(
                onPressed: () {
                  selectDate(context);
                },
                child: Text(
                    '${currentDate != null ? getCustomerJoiningDate(currentDate!.toIso8601String(), true) : getTranslated(context, StringsConstants.selectSpecificDate)}')),
            currentDate != null
                ? IconButton(
                    onPressed: () async {
                      await showCancelDateDialogue(context);
                    },
                    icon: Icon(Icons.cancel))
                : Container()
          ],
        ));
  }

  Future selectDate(BuildContext context) async {
    late DateTime initialDate = currentDate ?? DateTime.now();

    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime.utc(2021, 1),
        lastDate: DateTime.now());
    if (pickedDate != null && pickedDate != initialDate)
      // initialDate = pickedDate;
      setState(() {
        currentDate = pickedDate;
      });
    ordersCubit.fetchOrders(
      date: currentDate,
    );
    ordersNotifierInstance.resetFilterAndSortOptions();
  }

  Future showCancelDateDialogue(BuildContext context) {
    yesButtonFunction() {

      appRouter.pop(context);
      setState(() {
        currentDate = null;
      });
      fetchOrders();
    }

    noButtonFunction(BuildContext context) {
      appRouter.pop(context);
    }

    return showDialog<void>(
        context: context,
        builder: (innerContext) {
          return AlertDialog(
            title: Text(getTranslated(context, StringsConstants.cancelDate)!),
            content: Text(
                getTranslated(context, StringsConstants.cancelDateStatement)!),
            actions: [
              TextButton(
                  onPressed: yesButtonFunction,
                  child: Text(getTranslated(context, StringsConstants.yes)!)),
              TextButton(
                  onPressed: () {
                    noButtonFunction(context);
                  },
                  child: Text(getTranslated(context, StringsConstants.no)!))
            ],
          );
        });
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

// Widget getOrderStatusIcon(String orderStatus) {
//   // InProcessing ,Preparing , Delivering , Delivered , Cancelled
//   if (orderStatus == "Delivered") {
//     return Icon(
//       Icons.check_circle,
//       color: AppColors.color5EB15A,
//     );
//   } else if (orderStatus == "Cancelled") {
//     return Icon(
//       Icons.close,
//       color: AppColors.color5EB15A,
//     );
//   } else {
//     return Icon(
//       Icons.info,
//       color: AppColors.colorFFE57F,
//     );
//   }
// }
}
