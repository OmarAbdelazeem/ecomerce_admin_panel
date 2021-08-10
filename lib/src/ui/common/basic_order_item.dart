import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_admin_tut/src/core/utils/localization/localization_methods.dart';
import 'package:ecommerce_admin_tut/src/core/utils/utils/date_time_util.dart';
import 'package:ecommerce_admin_tut/src/models/basic_order_model.dart';
import 'package:ecommerce_admin_tut/src/res/string_constants.dart';
import 'package:ecommerce_admin_tut/src/res/text_styles.dart';
import 'package:ecommerce_admin_tut/src/routes/router.gr.dart';
import 'package:flutter/material.dart';

class BasicOrderItem extends StatelessWidget {
  final BasicOrderModel basicOrder;

  BasicOrderItem(this.basicOrder);

  @override
  Widget build(BuildContext context) {
    late StackRouter appRouter = AutoRouter.of(context);
    return Column(
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(top: 20, left: 16, right: 16),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                          '${getTranslated(context, StringsConstants.orderNumber)} : '),
                                      Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.3,
                                          child: Text(
                                            '${basicOrder.orderNumber != null ? basicOrder.orderNumber : getTranslated(context, StringsConstants.noNumber)!}',
                                            style: TextStyle(color: Colors.red),
                                          ))
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '${getTranslated(context, StringsConstants.total)} : ${basicOrder.total} LE',
                                // style: AppTextStyles.normal12Color81819A,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                getOrderedTime(basicOrder.orderedAt),
                                style: AppTextStyles.medium14Black,
                              )
                            ],
                          ),
                          Text(
                            basicOrder.orderStatus,
                            style: TextStyle(color: Colors.amber, fontSize: 17),
                          )
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      ),
                    ),
                  ],
                ),
                // orderCard(orderList[index].orderItems[0]),
                Icon(Icons.more_horiz),
                InkWell(
                  onTap: () {
                    appRouter.push(
                      OrderDetailsScreen(orderId: basicOrder.orderId),
                    );
                  },
                  child: Container(
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(getTranslated(
                            context, StringsConstants.viewOrderDetails)!),
                        Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                  ),
                )
              ],
            )),
      ],
    );
  }
}
