import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_admin_tut/src/core/utils/localization/localization_methods.dart';
import 'package:ecommerce_admin_tut/src/res/string_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:ecommerce_admin_tut/src/models/notification_model.dart';
import 'package:ecommerce_admin_tut/src/routes/router.gr.dart';
import 'package:flutter/material.dart';

class NotificationItem extends StatelessWidget {
  final NotificationModel notification;

  NotificationItem(this.notification);

  @override
  Widget build(BuildContext context) {
    StackRouter appRouter = AutoRouter.of(context);
    return InkWell(
      onTap: () {
        appRouter.push(CustomerProfileScreen(customerName: notification.name,customerId: notification.id));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 30,
              child: Text(
                notification.name[0],
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  notification.name,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  getTranslated(context, StringsConstants.justJoinedBaqal)!,
                  style: TextStyle(color: Colors.black45),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
