
import 'package:ecommerce_admin_tut/src/ui/common/basic_order_item.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_admin_tut/src/bloc/orders/orders.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
Widget ordersDataBuilder({required OrdersCubit ordersCubit}){
  return BlocBuilder<OrdersCubit, OrdersState>(
    bloc: ordersCubit,
    builder: (BuildContext context, state) {
        if (state is Loaded)
          return ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: state.orders.length,
            itemBuilder: (BuildContext context, int index) {
              return BasicOrderItem(state.orders[index]);
            },
          );
      else if (state is Loading)
          return Center(child: CircularProgressIndicator());
      return Container();
    },
  );
}


