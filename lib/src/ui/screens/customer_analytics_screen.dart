import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_admin_tut/src/core/utils/localization/localization_methods.dart';
import 'package:ecommerce_admin_tut/src/di/app_injector.dart';
import 'package:ecommerce_admin_tut/src/notifiers/language_notifier.dart';
import 'package:ecommerce_admin_tut/src/res/string_constants.dart';
import 'package:ecommerce_admin_tut/src/res/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_admin_tut/src/bloc/customer_analytics/customer_analytics.dart' as customer_analytics;
import 'package:ecommerce_admin_tut/src/models/customer_analytics_item.dart';

class CustomerAnalyticsScreen extends StatefulWidget {
  final String customerId;

  CustomerAnalyticsScreen(this.customerId);

  @override
  _CustomerAnalyticsScreenState createState() => _CustomerAnalyticsScreenState();
}

class _CustomerAnalyticsScreenState extends State<CustomerAnalyticsScreen> with AutomaticKeepAliveClientMixin{
  final customerAnalyticsCubit = getItInstance<customer_analytics.CustomerAnalyticsCubit>();
  final languageNotifier = getItInstance<LanguageNotifier>();

  @override
  void initState() {
    // TODO: implement initState

    customerAnalyticsCubit.getCustomerAnalytics(widget.customerId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<customer_analytics.CustomerAnalyticsCubit, customer_analytics.CustomerAnalyticsState>(
        bloc: customerAnalyticsCubit,
        builder: (BuildContext context, state) {
          if (state is customer_analytics.Loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is customer_analytics.Loaded) {
            return analyticsList(state.customerAnalyticsProducts);
            // return analyticsView(state.customerAnalyticsProducts);
          }

          return Container();
        },
      ),
    );
  }

  Widget analyticsView(List<CustomerAnalyticsModel> customerAnalytics) {
    return ListView.builder(
        itemCount: customerAnalytics.length,
        itemBuilder: (context, index) {
          return Text(languageNotifier.isEnglish ? customerAnalytics[index].name.english : customerAnalytics[index].name.arabic);
        });
  }

  Widget analyticsList(List<CustomerAnalyticsModel> customerAnalyticsList) {
    return Container(
      child: ListView.builder(
        itemCount: customerAnalyticsList.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return analyticProductItem(
            customerAnalyticsList[index],
          );
        },
      ),
    );
  }

  Widget analyticProductItem(CustomerAnalyticsModel customerAnalyticsItem) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        height: 160,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: Colors.white,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                child: CachedNetworkImage(
                  height: MediaQuery.of(context).size.height * .3,
                  width: MediaQuery.of(context).size.width * 0.2,
                  imageUrl: customerAnalyticsItem.image,
                  fit: BoxFit.fitWidth,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                margin: EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.60,
                      child: Text(
                        '${languageNotifier.isEnglish ? customerAnalyticsItem.name.english : customerAnalyticsItem.name.arabic}',
                        style: AppTextStyles.medium14Black,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('${getTranslated(context, StringsConstants.numberOfItems)} : ${customerAnalyticsItem.numberOfItems.toString()}'),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${getTranslated(context, StringsConstants.numberOfTimes)} : ${customerAnalyticsItem.numberOfTimes}'),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text('${getTranslated(context, StringsConstants.totalSpent)} : ${customerAnalyticsItem.totalSpent.toString()}'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
