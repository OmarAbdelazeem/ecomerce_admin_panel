import 'package:ecommerce_admin_tut/src/bloc/customers/customers.dart'
    as customers;
import 'package:ecommerce_admin_tut/src/di/app_injector.dart';
import 'package:ecommerce_admin_tut/src/ui/common/customers_builder.dart';
import 'package:flutter/material.dart';

class CustomersScreen extends StatefulWidget {
  @override
  _CustomersScreenState createState() => _CustomersScreenState();
}

class _CustomersScreenState extends State<CustomersScreen>
    with AutomaticKeepAliveClientMixin<CustomersScreen> {
  final customersCubit = getItInstance<customers.CustomersCubit>();

  @override
  void initState() {
    // TODO: implement initState
    fetchCustomers();
    super.initState();
  }

  Future<void> fetchCustomers() {
    return customersCubit.fetchCustomers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          RefreshIndicator(
            child: Container(
                height: MediaQuery.of(context).size.height * 0.9,
                child: customersDataBuilder(customersCubit)),
            onRefresh: fetchCustomers,
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
