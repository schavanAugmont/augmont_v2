import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DonutChartWidget extends StatelessWidget {
  final List<ChartData> chartData = [
    ChartData('Investment', 25),
    ChartData('Est. Returns', 38),
  ];

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(legend: Legend(
        isVisible: true,
        // Overflowing legend content will be wraped
        overflowMode: LegendItemOverflowMode.wrap
    ),series: <CircularSeries>[
      // Renders doughnut chart
      DoughnutSeries<ChartData, String>(

          dataSource: chartData,
          innerRadius: '80%',
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y)
    ]);
  }
}

class ChartData {
  ChartData(this.x, this.y);

  final String x;
  final double y;
}
