import 'package:ecommerce_admin_tut/src/bloc/admin_statistics/admin_statistics.dart'as admin_statistics;

import 'package:ecommerce_admin_tut/src/bloc/chart_choice/chart_choice.dart' as chart_choice;
import 'package:ecommerce_admin_tut/src/di/app_injector.dart';
import 'package:ecommerce_admin_tut/src/models/statistics_model.dart';
import 'package:ecommerce_admin_tut/src/res/string_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_bloc/flutter_bloc.dart';

class BarChartGraphScreen extends StatefulWidget {
  @override
  _BarChartGraphScreenState createState() => _BarChartGraphScreenState();
}

class _BarChartGraphScreenState extends State<BarChartGraphScreen> {

  final adminStatisticsCubit = getItInstance<admin_statistics.AdminStatisticsCubit>();
  final chartChoiceCubit = getItInstance<chart_choice.ChartChoiceCubit>();
  String ?val = 'Orders';
  List<DropdownMenuItem<String>> dropDownItems = [
    DropdownMenuItem(
      value: StringsConstants.totalIncome,
      child: Text(
        StringsConstants.totalIncome,
      ),
    ),
    DropdownMenuItem(
      value: StringsConstants.products,
      child: Text(
        StringsConstants.products,
      ),
    ),
    DropdownMenuItem(
      value: StringsConstants.customers,
      child: Text(
        StringsConstants.customers,
      ),
    ),
    DropdownMenuItem(
      value: StringsConstants.deliveredOrders,
      child: Text(
        StringsConstants.deliveredOrders,
      ),
    ),
    DropdownMenuItem(
      value: StringsConstants.canceledOrders,
      child: Text(
        StringsConstants.canceledOrders,
      ),
    ),
    DropdownMenuItem(
      value: StringsConstants.orders,
      child: Text(
        StringsConstants.orders,
      ),
    ),
  ];

  @override
  void initState() {
    // TODO: implement initState
    // adminStatisticsCubit.getStatistics(lastThirtyDays: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<admin_statistics.AdminStatisticsCubit, admin_statistics.AdminStatisticsState>(
      bloc: adminStatisticsCubit,
      builder: (context, state) {
        if (state is admin_statistics.Loaded) {
          print('chart cubit state is ${chartChoiceCubit.state}');
          List<StatisticsModel> analyticsModels = state.statistics;
          return BlocBuilder<chart_choice.ChartChoiceCubit, chart_choice.ChartChoiceState>(
            bloc: chartChoiceCubit,
            builder: (context, state) {
              List<charts.Series<StatisticsModel, DateTime>> series = [
                charts.Series<StatisticsModel, DateTime>(
                  id: 'Sales',
                  colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
                  domainFn: (StatisticsModel sales, _) => sales.id,
                  measureFn: (StatisticsModel sales, _) {
                    if (state is chart_choice.Users)
                      return sales.customers;
                    else if (state is chart_choice.TotalIncome)
                      return sales.totalIncome;
                    else if (state is chart_choice.Products)
                      return sales.addedProducts;
                    else if (state is chart_choice.CancelledOrders)
                      return sales.canceledOrders;
                    else if (state is chart_choice.DeliveredOrders)
                      return sales.deliveredOrders;
                    return sales.orders;
                  },
                  data: analyticsModels,
                )
              ];
              return Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Last 30 Days Analytics',
                    style: TextStyle(fontSize: 25),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  optionsDropDownMenu(),
                  seriesChart(series,context),
                ],
              );
            },
          );
        } else if (state is admin_statistics.Loading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Container();
      },
    );
  }

  Widget optionsDropDownMenu() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(height: 30, child: Text('Analyse by ')),
          SizedBox(
            width: 20,
          ),
          Container(
            width: 110,
            child: DropdownButton<String>(
              elevation: 16,
              isExpanded: true,
              icon: Row(
                children: [
                  Container(
                    child: Text(
                      val!,
                    ),
                    width: 70,
                    height: 40,
                  ),
                  Icon(Icons.arrow_drop_down)
                ],
              ),
              items: dropDownItems,
              onChanged: (v) {
                setState(() {
                  val = v;
                });
                chartChoiceCubit.selectChartChoice(v!);
                print('value is $v');
              },
            ),
          ),
        ],
      ),
    );
  }
  Widget seriesChart(
      List<charts.Series<dynamic , DateTime>> seriesList, BuildContext context) {
    print('SimpleTimeSeriesChart is called');
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      child: charts.TimeSeriesChart(
        seriesList,
        animate: true,
        dateTimeFactory: const charts.LocalDateTimeFactory(),
      ),
    );
  }
}

