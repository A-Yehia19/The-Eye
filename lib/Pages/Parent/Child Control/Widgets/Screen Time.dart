import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:the_eye/Constants/Colors.dart';

class ScreenTime extends StatelessWidget {
  final Map<String, double> period;
  const ScreenTime({super.key, required this.period});

  static const List<Color> gradientColors = [
    primaryColor,
    Colors.blue,
  ];

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.70,
      child: Padding(
        padding: const EdgeInsets.only(
          right: 18,
          left: 12,
          top: 24,
          bottom: 12,
        ),
        child: LineChart(
          curve: Curves.easeInOut,
          duration: const Duration(milliseconds: 300),
          mainData(),
        ),
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 14,
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(period.keys.toList()[value.toInt()], style: style),
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(fontSize: 14, fontWeight: FontWeight.w600);
    String text;

    final maxVal = period.values.reduce((value, element) => value > element ? value : element);
    final part = maxVal/6;

    switch (value.toInt()) {
      case 1:
        text = part.toStringAsFixed(1);
        break;
      case 3:
        text = (3*part).toStringAsFixed(1);
        break;
      case 5:
        text = (5*part).toStringAsFixed(1);
        break;
      default:
        return const SizedBox();
    }

    return Text('$text H', style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Colors.green,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 6,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, period['sun']??0),
            FlSpot(1, period['mon']??0),
            FlSpot(2, period['tue']??0),
            FlSpot(3, period['wed']??0),
            FlSpot(4, period['thu']??0),
            FlSpot(5, period['fri']??0),
            FlSpot(6, period['sat']??0),
          ],
          isCurved: true,
          gradient: const LinearGradient(colors: gradientColors),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(show: false),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}