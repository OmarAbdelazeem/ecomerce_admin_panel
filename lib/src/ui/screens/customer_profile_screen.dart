
import 'package:ecommerce_admin_tut/src/core/utils/localization/localization_methods.dart';
import 'package:ecommerce_admin_tut/src/res/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_admin_tut/src/ui/common/tab_bar_widget.dart';
import 'package:ecommerce_admin_tut/src/models/notification_model.dart';
import 'package:ecommerce_admin_tut/src/ui/screens/customer_info_screen.dart';
import 'package:ecommerce_admin_tut/src/ui/screens/customer_analytics_screen.dart';
import 'package:ecommerce_admin_tut/src/ui/screens/customer_orders_screen.dart';

class CustomerProfileScreen extends StatefulWidget {
  // final NotificationModel notification;
  final String customerId;
  final String customerName;


  // CustomerProfileScreen(this.notification);
  CustomerProfileScreen(this.customerId,this.customerName);

  @override
  _CustomerProfileScreenState createState() => _CustomerProfileScreenState();
}

class _CustomerProfileScreenState extends State<CustomerProfileScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(initialIndex: 0, length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> tabs = [
      TabBarWidget(Icon(Icons.info), getTranslated(context,StringsConstants.information)!),
      TabBarWidget(Icon(Icons.inbox_sharp), getTranslated(context,StringsConstants.orders)!),
      TabBarWidget(Icon(Icons.analytics), getTranslated(context,StringsConstants.analytics)!),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.customerName),
        bottom: TabBar(
          controller: tabController,
          tabs: tabs,
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          CustomerInfoScreen(widget.customerId),
          CustomerOrdersScreen(widget.customerId),
          CustomerAnalyticsScreen(widget.customerId),
        ],
      ),
    );
  }
}
