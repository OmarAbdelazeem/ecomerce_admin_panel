import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_admin_tut/src/core/utils/utils/date_time_util.dart';
import 'package:ecommerce_admin_tut/src/di/app_injector.dart';
import 'package:ecommerce_admin_tut/src/bloc/orders/orders.dart';
import 'package:ecommerce_admin_tut/src/models/basic_order_model.dart';
import 'package:ecommerce_admin_tut/src/models/order_model.dart';
import 'package:ecommerce_admin_tut/src/res/text_styles.dart';
import 'package:ecommerce_admin_tut/src/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerOrdersScreen extends StatefulWidget {
  final String id;

  CustomerOrdersScreen(this.id);

  @override
  _CustomerOrdersScreenState createState() => _CustomerOrdersScreenState();
}

class _CustomerOrdersScreenState extends State<CustomerOrdersScreen> with AutomaticKeepAliveClientMixin{
  final ordersCubit = getItInstance<OrdersCubit>();
 late StackRouter appRouter ;

  @override
  void initState() {
    ordersCubit.fetchCustomerOrders(widget.id);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    appRouter = AutoRouter.of(context);
    return BlocBuilder<OrdersCubit , OrdersState>(
      bloc: ordersCubit,
      builder: (BuildContext context , state){
         if(state is Loaded)
         return orderView(state.orders);
         else if(state is Loading )
           return Center(child: CircularProgressIndicator(),);
         return Container();
      },
    );

  }

  Widget orderView(List<BasicOrderModel> orderList) {
    return ListView.builder(
      // controller: controller,
      itemCount: orderList.length,
      itemBuilder: (BuildContext context, int index) {
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
                                  Text(
                                    'Order ID: ${orderList[index].orderId}',
                                    // style: AppTextStyles.normal12Color81819A,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  // Text(
                                  //   StringsConstants.orderedOnCaps,
                                  //   style: AppTextStyles.normal12Color81819A,
                                  // ),
                                  Text(
                                    getOrderedTime(
                                        orderList[index].orderedAt),
                                    style: AppTextStyles.medium14Black,
                                  )
                                ],
                              ),
                              Text(
                                '${orderList[index].orderStatus}',
                                style: TextStyle(
                                    color: Colors.amber, fontSize: 17),
                              )
                            ],
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          ),
                        ),
                      ],
                    ),

                    // orderCard(orderList[orderListIndex].orderItems[0]),
                    Icon(Icons.more_horiz),
                    InkWell(
                      onTap: () {
                        appRouter.push(OrderDetailsScreen(orderId: orderList[index].orderId));

                      },
                      child: Container(
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('View order details'),
                            Icon(Icons.arrow_forward_ios)
                          ],
                        ),
                      ),
                    )
                  ],
                )),
            (index < orderList.length) ? Divider() : Container()
          ],
        );
      },
    );
  }

  Widget orderCard(OrderItem orderItem) {
    return Container(
      margin: EdgeInsets.only(top: 16, bottom: 20),
      child: Card(
          child: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CachedNetworkImage(
                  imageUrl: orderItem.image,
                  height: 46,
                  width: 46,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      orderItem.name,
                      style: AppTextStyles.normal14Black,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "EGP ${orderItem.price}",
                      style: AppTextStyles.normal14Color81819A,
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "${orderItem.noOfItems} item${orderItem.noOfItems > 1 ? "s" : ""}",
              style: AppTextStyles.normal14Color81819A,
            ),
          ],
        ),
      )),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
