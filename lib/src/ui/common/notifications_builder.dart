import 'package:flutter/cupertino.dart';
import 'package:ecommerce_admin_tut/src/bloc/notifications/notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'notification_item.dart';

Widget notificationsBuilder(NotificationsCubit notificationsCubit){
  return BlocBuilder<NotificationsCubit, NotificationsState>(
    bloc: notificationsCubit,
    builder: (context, state) {
      if (state is Loading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is Loaded) {
        return ListView.builder(
            itemCount: state.notifications.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return NotificationItem(state.notifications[index]);
            });
      } else if (state is Error) {
        return Center(
          child: Text('${state.error as Error}'),
        );
      }
      return Container();
    },
  );
}
