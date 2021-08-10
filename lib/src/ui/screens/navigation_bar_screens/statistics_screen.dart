import 'package:ecommerce_admin_tut/src/bloc/admin_statistics/admin_statistics.dart'
    as admin_statistics;
import 'package:ecommerce_admin_tut/src/core/utils/localization/localization_methods.dart';
import 'package:ecommerce_admin_tut/src/core/utils/localization/picked_time_type.dart';
import 'package:ecommerce_admin_tut/src/core/utils/utils/date_time_util.dart';
import 'package:ecommerce_admin_tut/src/di/app_injector.dart';
import 'package:ecommerce_admin_tut/src/res/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import '../bar_chart_graph_screen.dart';


// make numeric statistics list view horizontal or page view
class StatisticsScreen extends StatefulWidget {
  @override
  _StatisticsScreenState createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen>
    with AutomaticKeepAliveClientMixin<StatisticsScreen> {

  final adminStatisticsCubit =
      getItInstance<admin_statistics.AdminStatisticsCubit>();
  late DateTime initialDate = DateTime.now();
  late DateTime initialMonth = DateTime.now();
  late String selectedTime = formatDateStatistics(DateTime.now(), true);

  @override
  void initState() {
    adminStatisticsCubit.getStatistics(
        pickedTimeType: PickedTimeType.day, selectedTime: DateTime.now());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          selectTimeWidget(),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: BlocBuilder<admin_statistics.AdminStatisticsCubit,
                admin_statistics.AdminStatisticsState>(
              bloc: adminStatisticsCubit,
              builder: (context, state) {
                if (state is admin_statistics.Loading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is admin_statistics.Loaded) {
                  return GridView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 20),
                    children: [
                      reportCard(
                          title: StringsConstants.customers,

                          number: '${state.statistics.customers}',
                          icon: Icon(Icons.supervised_user_circle_rounded)),
                      reportCard(
                          title: StringsConstants.totalIncome,

                          number: 'LE ${state.statistics.totalIncome}',
                          icon: Icon(Icons.monetization_on)),
                      reportCard(
                          title: StringsConstants.products,

                          number: '${state.statistics.addedProducts}',
                          icon: Icon(Icons.local_grocery_store)),
                      reportCard(
                          title: StringsConstants.totalOrders,

                          number: '${state.statistics.orders}',
                          icon: Icon(Icons.inbox)),
                      reportCard(
                          title: StringsConstants.canceledOrders,

                          number: '${state.statistics.canceledOrders}',
                          icon: Icon(
                            Icons.close,
                          )),
                      reportCard(
                          title: StringsConstants.deliveredOrders,
                          number: '${state.statistics.deliveredOrders}',
                          icon: Icon(Icons.delivery_dining)),
                    ],
                  );
                }
                return Container();
              },
            ),
          ),
          BarChartGraphScreen(),
        ],
      ),
    ));
  }

  Widget reportCard(
      {required String number, required String title, required Icon icon}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.grey.shade100,
      ),
      height: 160,
      width: 160,
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Container(
                    width: 120,
                    child: Text(
                      '$number',
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    )),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 120,
                  child: Text(
                    getTranslated(
                        context , title)!,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            icon
          ],
        ),
      ),
    );
  }

  Widget selectTimeWidget() {
    return Row(children: [
      TextButton(
          onPressed: () async {
            await showSetTimeDialogue();
          },
          child: Text(getTranslated(context, StringsConstants.selectTime)!)),
      SizedBox(
        width: 50,
      ),
      Text(
        selectedTime,
        style: TextStyle(fontSize: 13),
      )
    ]);
  }

  Future showSetTimeDialogue() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(getTranslated(context, StringsConstants.selectTime)!),
            content: Container(
              height: MediaQuery.of(context).size.height * 0.25,
              child: Column(
                children: [
                  TextButton(
                    child: Text(
                      getTranslated(context, StringsConstants.selectDate)!,
                      style: TextStyle(fontSize: 16),
                    ),
                    onPressed: () async {
                      Navigator.pop(context);
                      datePicker();
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    child: Text(
                      getTranslated(context, StringsConstants.selectMonth)!,
                      style: TextStyle(fontSize: 16),
                    ),
                    onPressed: () async {
                      Navigator.pop(context);
                      monthPicker();
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    child: Text(
                      getTranslated(context, StringsConstants.total)!,
                      style: TextStyle(fontSize: 16),
                    ),
                    onPressed: () async {
                      setState(() {
                        selectedTime = 'Total';
                      });
                      adminStatisticsCubit.getStatistics();
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future datePicker() async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime.utc(2021, 1),
        lastDate: DateTime.now());
    if (pickedDate != null) {
      initialDate = pickedDate;
      setState(() {
        selectedTime = formatDateStatistics(pickedDate, true);
      });
      adminStatisticsCubit.getStatistics(
          pickedTimeType: PickedTimeType.day, selectedTime: pickedDate);
    }
  }

  Future monthPicker() async {
    DateTime? pickedMonth = await showMonthPicker(
        context: context,
        firstDate: DateTime.utc(2021, 1),
        lastDate: DateTime.now(),
        initialDate: initialMonth);

    if (pickedMonth != null) {
      initialMonth = pickedMonth;
      setState(() {
        selectedTime = formatMonthStatistics(pickedMonth, true);
      });
      adminStatisticsCubit.getStatistics(
          pickedTimeType: PickedTimeType.month, selectedTime: pickedMonth);
    }
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
