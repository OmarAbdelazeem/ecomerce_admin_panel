import 'package:ecommerce_admin_tut/src/bloc/customers/customers_cubit.dart';
import 'package:ecommerce_admin_tut/src/bloc/customers/customers_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'customer_widget.dart';


Widget customersDataBuilder(CustomersCubit customersCubit) {
  return BlocBuilder<CustomersCubit, CustomersState>(
      bloc: customersCubit,
      builder: (BuildContext context, CustomersState state) {
        if (state is Loading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is CustomersLoaded) {
          return ListView.builder(
            itemCount: state.customers.length,
            itemBuilder: (BuildContext context, int index) {
              return CustomerItem(state.customers[index]);
            },
          );
        }
        // ignore: missing_return
        else if (state is Error) {
          return Text(state.error);
        }
        return Container();
      });
}