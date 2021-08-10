import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_admin_tut/src/bloc/order_item/order_item.dart' as order_item;
import 'package:ecommerce_admin_tut/src/bloc/order_status/order_status.dart' as order_status;
import 'package:ecommerce_admin_tut/src/core/utils/localization/localization_methods.dart';
import 'package:ecommerce_admin_tut/src/core/utils/utils/date_time_util.dart';
import 'package:ecommerce_admin_tut/src/di/app_injector.dart';
import 'package:ecommerce_admin_tut/src/models/customer_model.dart';
import 'package:ecommerce_admin_tut/src/models/order_model.dart';
import 'package:ecommerce_admin_tut/src/res/string_constants.dart';
import 'package:ecommerce_admin_tut/src/res/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderDetailsScreen extends StatefulWidget {
  final String orderId;
  OrderDetailsScreen(this.orderId);

  @override
  _OrderDetailsScreenState createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  final orderCubit = getItInstance<order_item.OrderCubit>();
  final orderStatusCubit = getItInstance<order_status.OrderStatusCubit>();

  @override
  void initState() {
    orderCubit.fetchOrderDetails(widget.orderId);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getTranslated(context, StringsConstants.orderDetails)!),
      ),
      body: BlocConsumer(
        bloc: orderCubit,
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) {
          if (state is order_item.Loaded) {
            return orderView(state.order);
          } else if (state is order_item.Loading)
            return Center(
              child: CircularProgressIndicator(),
            );
          return Container();
        },
      ),
    );
  }

  Widget orderView(OrderModel order) {
    return SingleChildScrollView(
        child: Column(
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(top: 20, left: 16, right: 16),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          BlocBuilder<order_status.OrderStatusCubit,order_status.OrderStatusState>(
                              bloc: orderStatusCubit,
                              builder: (BuildContext context , state){

                            if (state is order_status.Loading)
                             return CircularProgressIndicator();
                            else if (state is order_status.Loaded)
                              return Column(
                                children: [
                                  getOrderStatusStatement(order.orderStatus),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  statusButton(order.orderStatus),
                                ],
                              );
                            else
                              return Column(
                                children: [
                                  getOrderStatusStatement(order.orderStatus),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  statusButton(order.orderStatus),
                                ],
                              );
                          }),

                          // Text(
                          //   'Your order is in processing...',
                          //   style: TextStyle(fontSize: 20),
                          // ),
                          // SizedBox(
                          //   height: 10,
                          // ),
                          // TextButton(
                          //   child: Text('Cancel order',
                          //       style: TextStyle(
                          //           color: Colors.red, fontSize: 17)),
                          //   onPressed: () {
                          //     // placeOrderCubit.cancelOrder(widget.order.orderId);
                          //   },
                          // ),
                          // SizedBox(
                          //   height: 10,
                          // ),
                          // Text(
                          //   'Order ID: ${order.orderId}',
                          //   // style: AppTextStyles.normal12Color81819A,
                          // ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            getOrderedTime(order.orderedAt),
                            style: AppTextStyles.medium14Black,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                ...List<Widget>.generate(order.orderItems!.length,
                    (index) => orderCard(order.orderItems![index]!)),
                SizedBox(
                  height: 10,
                ),
                deliveryAddress(order.orderAddress),
                SizedBox(
                  height: 30,
                ),
                paymentSummary(order.total),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Row(
                //       children: [
                //         Text(
                //           StringsConstants.totalCaps,
                //           style: AppTextStyles.normal12Color81819A,
                //         ),
                //         SizedBox(
                //           width: 13,
                //         ),
                //         Text(
                //           "EGP ${widget.order.total}",
                //           style: AppTextStyles.normal14Black,
                //         )
                //       ],
                //     ),
                //     Row(
                //       children: [
                //         Text(
                //           "${widget.order.orderStatus}",
                //           style: AppTextStyles.normal14Color81819A,
                //         ),
                //         SizedBox(
                //           width: 10,
                //         ),
                //       ],
                //     )
                //   ],
                // ),
                // SizedBox(
                //   height: 20,
                // )
              ],
            )),
        // (orderListIndex < orderList.length) ? Divider() : Container()
      ],
    ));
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

  Widget deliveryAddress(Address address) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.motorcycle_outlined,
              size: 35,
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              'Delivery Address',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                address.name,
                style: TextStyle(fontSize: 17),
              ),
              SizedBox(
                height: 10,
              ),
              Text(address.city, style: TextStyle(fontSize: 17)),
              SizedBox(
                height: 10,
              ),
              Text(address.address, style: TextStyle(fontSize: 17)),
              SizedBox(
                height: 10,
              ),
              Text('Mobile: ${address.phoneNumber}',
                  style: TextStyle(fontSize: 17)),
            ],
          ),
        )
      ],
    );
  }

  Widget paymentSummary(num total) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Payment Summary',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Subtotal'),
            Text('EGP $total'),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Service charge'),
            Text('EGP 10'),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Total amount'),
            Text('EGP 32'),
          ],
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }

  Widget getOrderStatusStatement(String status) {
    if (status == 'Processing') {
      return Text(
        'You have not prepared this order yet',
        style: TextStyle(color: Colors.amber, fontSize: 18),
      );
    } else if (status == 'Delivering') {
      return Text('Was order delivered or cancelled ?',
          style: TextStyle(color: Colors.deepPurple, fontSize: 18));
    } else if (status == 'Delivered') {
      return Text(
        'Order was delivered',
        style: TextStyle(color: Colors.green, fontSize: 18),
      );
    } else {
      return Text(
        'Customer cancelled this order',
        style: TextStyle(color: Colors.red, fontSize: 18),
      );
    }
  }

  Widget statusButton(String currentStatus) {
    if (currentStatus == StringsConstants.processing) {
      return TextButton(
        child: Text(
          'Prepare Order',
          style: TextStyle(color: Colors.green.shade600, fontSize: 17),
        ),
        onPressed: () {
          orderStatusCubit.updateOrderStatus(
              orderId: widget.orderId, status: StringsConstants.delivering);

        },
      );
    } else if (currentStatus == StringsConstants.delivering) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            child: Text('Delivered',
                style: TextStyle(color: Colors.green.shade600, fontSize: 17)),
            onPressed: () {
              orderStatusCubit.updateOrderStatus(
                  orderId: widget.orderId, status: StringsConstants.delivered);

            },
          ),
          SizedBox(
            width: 15,
          ),
          TextButton(
            child: Text('Cancelled',
                style: TextStyle(color: Colors.red, fontSize: 17)),
            onPressed: () {
              orderStatusCubit.updateOrderStatus(
                  orderId: widget.orderId, status: StringsConstants.cancelled);
            },
          )
        ],
      );
    } else {
      return Container();
    }
  }
}
