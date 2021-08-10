import 'package:charts_flutter/flutter.dart' as charts;

// class BarChartModel {
//   // String month;
//   String day;
//   int financial;
//   final charts.Color color;
//
//   // BarChartModel({this.month,
//   //   this.day, this.financial,
//   //   this.color,}
//   //     );
//   BarChartModel({
//     this.day, this.financial,
//     this.color,}
//       );
// }

class BarChartModel {
  // String month;
 late int day;
 late int financial;


  // BarChartModel({this.month,
  //   this.day, this.financial,
  //   this.color,}
  //     );
  BarChartModel({
    required this.day, required this.financial,}
      );
}