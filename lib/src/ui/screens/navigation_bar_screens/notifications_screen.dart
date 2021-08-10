import 'package:ecommerce_admin_tut/src/di/app_injector.dart';
import 'package:ecommerce_admin_tut/src/bloc/notifications/notifications.dart' as notifications;
import 'package:ecommerce_admin_tut/src/bloc/notifications/notifications_state.dart';
import 'package:ecommerce_admin_tut/src/ui/common/notification_item.dart';
import 'package:ecommerce_admin_tut/src/models/notification_model.dart';
import 'package:ecommerce_admin_tut/src/ui/common/notifications_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationsScreen extends StatefulWidget {
  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> with AutomaticKeepAliveClientMixin{
  final notificationsCubit = getItInstance<notifications.NotificationsCubit>();

  @override
  void initState() {
    notificationsCubit.fetchNotifications();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: notificationsBuilder(notificationsCubit),
    );
  }



  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
