import 'package:augmont_v2/Utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class BarchartWidegt extends StatelessWidget{
  List<_SalesData> data = [
    _SalesData('Total \nInvestment', 250000),
    _SalesData('Other Platform\n Returns', 1725000),
    _SalesData('Augmont \nReturns', 1925000),
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
        series: <CartesianSeries<_SalesData, String>>[
          ColumnSeries<_SalesData, String>(
            width: 0.45,
              color: primaryTextColor,
              dataSource: data,
              xValueMapper: (_SalesData sales, _) => sales.year,
              yValueMapper: (_SalesData sales, _) => sales.sales,
              dataLabelSettings: DataLabelSettings(isVisible: true)),
        ]);
  }

}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}