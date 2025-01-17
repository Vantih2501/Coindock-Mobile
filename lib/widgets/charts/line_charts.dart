import 'package:coindock_app/%20util/constants/colors.dart';
import 'package:coindock_app/data/line_chart_data.dart';
import 'package:coindock_app/widgets/card/_card_custom.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartCard extends StatelessWidget {
  const LineChartCard({super.key});

  @override
  Widget build(BuildContext context) {
    final data = LineData();

    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 16 / 6,
            child: LineChart(
              LineChartData(
                lineTouchData: LineTouchData(
                  touchSpotThreshold: 5,
                  getTouchLineStart: (_, __) => -double.infinity,
                  getTouchLineEnd: (_, __) => double.infinity,
                  getTouchedSpotIndicator:
                      (LineChartBarData barData, List<int> spotIndexes) {
                    return spotIndexes.map((spotIndex) {
                      return TouchedSpotIndicatorData(
                        const FlLine(
                          color: Colors.red,
                          strokeWidth: 1,
                          dashArray: [8, 2],
                        ),
                        FlDotData(
                          show: true,
                          getDotPainter: (spot, percent, barData, index) {
                            return FlDotCirclePainter(
                              radius: 6,
                              color: AppColors.primary,
                              strokeWidth: 0,
                              strokeColor: AppColors.primary,
                            );
                          },
                        ),
                      );
                    }).toList();
                  },
                  touchTooltipData: LineTouchTooltipData(
                    getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
                      return touchedBarSpots.map((barSpot) {
                        final price = barSpot.y;
                        // final date = _bitcoinPriceHistory![barSpot.x.toInt()].$1;
                        return LineTooltipItem(
                          '',
                          TextStyle(
                            color: AppColors.light,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                          children: [
                            TextSpan(
                              text: '${13}/${01}/${2005}',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                            TextSpan(
                              text: '\$10,000',
                              style: TextStyle(
                                color: AppColors.light,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        );
                      }).toList();
                    },
                    getTooltipColor: (LineBarSpot barSpot) =>
                        AppColors.dark,
                  ),
                ),
                gridData: FlGridData(show: false),
                titlesData: FlTitlesData(
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                        showTitles: false,
                    )),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: false
                  ))
                  // bottomTitles: AxisTitles(
                  //   sideTitles: SideTitles(
                  //     showTitles: true,
                  //     getTitlesWidget: (double value, TitleMeta meta) {
                  //       return data.bottomTitle[value.toInt()] != null
                  //           ? SideTitleWidget(
                  //               meta: meta,
                  //               // axisSide: meta.axisSide,
                  //               child: Text(
                  //                   data.bottomTitle[value.toInt()].toString(),
                  //                   style: TextStyle(
                  //                       fontSize: 12, color: Colors.grey[400])),
                  //             )
                  //           : const SizedBox();
                  //     },
                  //   ),
                  // ),
                  // leftTitles: AxisTitles(
                  //   sideTitles: SideTitles(
                  //     getTitlesWidget: (double value, TitleMeta meta) {
                  //       return data.leftTitle[value.toInt()] != null
                  //           ? Text(data.leftTitle[value.toInt()].toString(),
                  //               style: TextStyle(
                  //                   fontSize: 12, color: Colors.grey[400]))
                  //           : const SizedBox();
                  //     },
                  //     showTitles: true,
                  //     interval: 1,
                  //     reservedSize: 40,
                  //   ),
                  // ),
                ),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    color: AppColors.primary,
                    barWidth: 1,
                    belowBarData: BarAreaData(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColors.primary.withOpacity(0.5),
                          AppColors.primary.withOpacity(0)
                        ],
                      ),
                      show: true,
                    ),
                    dotData: FlDotData(show: false),
                    spots: data.spots,
                  )
                ],
                minX: 0,
                maxX: 120,
                maxY: 105,
                minY: -5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}