import 'package:ecommerce_admin_tut/src/bloc/customers/customers.dart'
    as customers;
import 'package:ecommerce_admin_tut/src/core/utils/localization/localization_methods.dart';
import 'package:ecommerce_admin_tut/src/core/utils/utils/date_time_util.dart';
import 'package:ecommerce_admin_tut/src/di/app_injector.dart';
import 'package:ecommerce_admin_tut/src/models/customer_model.dart';
import 'package:ecommerce_admin_tut/src/notifiers/language_notifier.dart';
import 'package:ecommerce_admin_tut/src/res/app_colors.dart';
import 'package:ecommerce_admin_tut/src/res/string_constants.dart';
import 'package:ecommerce_admin_tut/src/res/text_styles.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerInfoScreen extends StatefulWidget {
  final String customerId;

  CustomerInfoScreen(this.customerId);

  @override
  _CustomerInfoScreenState createState() => _CustomerInfoScreenState();
}

class _CustomerInfoScreenState extends State<CustomerInfoScreen>
    with AutomaticKeepAliveClientMixin {
  final customersCubit = getItInstance<customers.CustomersCubit>();
  final languageNotifier = getItInstance<LanguageNotifier>();
  TextStyle titleStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

  @override
  void initState() {
    customersCubit.fetchCustomerInfo(widget.customerId);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<customers.CustomersCubit, customers.CustomersState>(
        bloc: customersCubit,
        builder: (context, state) {
          if (state is customers.Loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is customers.CustomerLoaded) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  adminProfilePhoto(
                      state.customer.name, state.customer.phoneNumber),
                  SizedBox(
                    height: 15,
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          getTranslated(context, StringsConstants.totalSpent)!,
                          // style: TextStyle(
                          //     fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '${state.customer.totalSpent}',
                          // style: TextStyle(
                          //     fontSize: 25, fontWeight: FontWeight.bold)
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Divider(
                          thickness: 1,
                        ),
                        Text(
                          getTranslated(context, StringsConstants.joinedSince)!,
                          style: TextStyle(fontSize: 15),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          getCustomerJoiningDate(
                              state.customer.date, languageNotifier.isEnglish),
                          style: TextStyle(fontSize: 15),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          getTranslated(context, StringsConstants.quickContact)!,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            quickContactOption(Icon(Icons.phone), () {}),
                            // SizedBox(width: 10,),
                            quickContactOption(Icon(Icons.message), () {}),
                            // SizedBox(width: 10,),
                            quickContactOption(
                                Icon(Icons.speaker_phone_sharp), () {}),
                            // SizedBox(width: 10,)
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        getTranslated(context, StringsConstants.addresses)!,
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  ...state.customer.addresses!
                      .map((address) => addressView(address!))
                      .toList()
                ],
              ),
            );
            // return Padding(
            //   padding: const EdgeInsets.all(15),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Text(
            //         'Name',
            //         style: titleStyle,
            //       ),
            //       SizedBox(
            //         height: 10,
            //       ),
            //       Text(state.customer.name),
            //       SizedBox(
            //         height: 20,
            //       ),
            //       Text(
            //         'Mobile',
            //         style: titleStyle,
            //       ),
            //       SizedBox(
            //         height: 10,
            //       ),
            //       Text(state.customer.phoneNumber),
            //       SizedBox(
            //         height: 20,
            //       ),
            //       Text(
            //         'Addresses',
            //         style: titleStyle,
            //       ),
            //       SizedBox(
            //         height: 10,
            //       ),
            //
            //       if (state.customer.addresses.isEmpty)
            //         Text(
            //           "No Address Found",
            //           style: AppTextStyles.medium18Black,
            //         )
            //       else
            //         ...state.customer.addresses
            //             .map((address) => addressCard(address))
            //     ],
            //   ),
            // );
          } else if (state is customers.Error) {
            return Text(state.error);
          }
          return Container();
        });
  }

  Widget quickContactOption(Icon icon, Function()? onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: Colors.grey.shade200,
        height: 120,
        width: 100,
        child: icon,
      ),
    );
  }

  Widget adminProfilePhoto(String name, String phoneNumber) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey.shade300,
            child: Text(
              name[0],
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.w200),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 16, right: 16, top: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          name,
                          style: AppTextStyles.medium22Black,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          phoneNumber,
                          style: AppTextStyles.normal14Color4C4C6F,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

Widget addressCard(Address address) {
  Widget data(IconData iconData, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          iconData,
          color: AppColors.color81819A,
        ),
        SizedBox(
          width: 12,
        ),
        Expanded(
            child: Text(
          "$text",
          style: AppTextStyles.normal12Color81819A,
        ))
      ],
    );
  }

  return Container(
      margin: EdgeInsets.only(right: 15, bottom: 30),
      child: Card(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                address.name,
                style: AppTextStyles.medium14Black,
              ),
              SizedBox(
                height: 33,
              ),
              data(Icons.phone, address.phoneNumber),
              SizedBox(
                height: 23,
              ),
              data(Icons.place,
                  "${address.address} , ${address.city} , ${address.state}"),
            ],
          ),
        ),
      ));
}

Widget addressView(Address address) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            'All, ${address.address + ' , ' + address.city + ' , ' + address.state}'),
        SizedBox(
          height: 10,
        ),
        Text(
          address.phoneNumber,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Divider(
          thickness: 1,
        )
      ],
    ),
  );
}
