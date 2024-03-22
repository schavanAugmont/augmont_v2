import 'package:augmont_v2/Utils/colors.dart';
import 'package:augmont_v2/models/barchart_model.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class BarchartWidegt extends StatelessWidget{
   final String screen;
   BarchartWidegt({super.key, required this.screen});

  List<BarchartModel> data = [
    BarchartModel('Total \nInvestment', 250000),
    BarchartModel('Other Platform\n Returns', 1725000),
    BarchartModel('Augmont \nReturns', 1925000),
  ];

  List<BarchartModel> data1 = [
    BarchartModel('Normal SIP', 250000),
    BarchartModel('Step-upSIP', 1725000),
  ];
  @override
  Widget build(BuildContext context) {
    return  SfCartesianChart(

        primaryXAxis: CategoryAxis(
          isVisible: true,
            majorGridLines: const MajorGridLines(width: 0)
        ),
        primaryYAxis: CategoryAxis(
          isVisible: false,
        ),
        plotAreaBorderWidth: 0,
        series: <CartesianSeries<BarchartModel, String>>[
          ColumnSeries<BarchartModel, String>(
            width: 0.45,
              color: primaryTextColor,
              dataSource: screen=='stepup'?data1:data,
              xValueMapper: (BarchartModel sales, _) => sales.year,
              yValueMapper: (BarchartModel sales, _) => sales.sales,
              dataLabelSettings: DataLabelSettings(isVisible: true)),
        ]);
  }

}

