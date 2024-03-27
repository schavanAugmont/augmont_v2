import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class LinechartWidget extends StatelessWidget{
  List<_SalesData> data = [
    _SalesData('01 Feb', 8),
    _SalesData('02 Feb', 13),
    _SalesData('03 Feb', 26),
    _SalesData('04 Feb', 30),
    _SalesData('05 Feb', 48)
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
          LineSeries<_SalesData, String>(
              dataSource: data,
              xValueMapper: (_SalesData sales, _) => sales.year,
              yValueMapper: (_SalesData sales, _) => sales.sales,
              dataLabelSettings: DataLabelSettings(isVisible: false)),

        ]);
  }
  
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}