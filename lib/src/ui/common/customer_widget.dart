import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_admin_tut/src/core/utils/localization/localization_methods.dart';
import 'package:ecommerce_admin_tut/src/core/utils/utils/date_time_util.dart';
import 'package:ecommerce_admin_tut/src/di/app_injector.dart';
import 'package:ecommerce_admin_tut/src/notifiers/language_notifier.dart';
import 'package:ecommerce_admin_tut/src/res/string_constants.dart';
import 'package:ecommerce_admin_tut/src/routes/router.gr.dart';
import 'package:ecommerce_admin_tut/src/models/customer_model.dart';
import 'package:flutter/material.dart';

class CustomerItem extends StatelessWidget {
  final CustomerModel customer;

  CustomerItem(this.customer);

  @override
  Widget build(BuildContext context) {
    final appRouter = AutoRouter.of(context);
    final languageNotifier = getItInstance<LanguageNotifier>();
    return InkWell(
      onTap: () {
        appRouter.push(CustomerProfileScreen(
            customerId: customer.id, customerName: customer.name));
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey.shade400,
              child: Text(
                customer.name[0],
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.w200),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  customer.name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
