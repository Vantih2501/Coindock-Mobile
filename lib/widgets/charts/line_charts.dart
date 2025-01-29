import 'package:coindock_app/%20util/constants/colors.dart';
import 'package:coindock_app/util/constants/colors.dart';
import 'package:coindock_app/data/line_chart_data.dart';
import 'package:coindock_app/model/coin_chart/chart_coin_model.dart';
import 'package:coindock_app/service/coin_gecko_service/_coin_market.dart';
import 'package:coindock_app/widgets/card/_card_custom.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartCard extends StatefulWidget {
  final String id;
  final String currency;
  final int days;

  const LineChartCard({
    super.key,
    required this.id,
    required this.currency,
    required this.days,
  });

  @override
  State<LineChartCard> createState() => _LineChartCardState();
}

class _LineChartCardState extends State<LineChartCard> {
  late Future<ChartData> _coinChartData;

  @override
  void initState() {
    super.initState();
    _coinChartData = _fetchCoinChartData();
  }

  Future<ChartData> _fetchCoinChartData() async {
    return await ClassCoinMarket().getCoinMarketChart(
      id: widget.id,
      days: widget.days,
      currency: widget.currency,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ChartData>(
      future: _coinChartData,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.prices.isEmpty) {
          return const Center(child: Text('No data available'));
        }

        final data = snapshot.data!;

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
                            return LineTooltipItem(
                              '',
                              TextStyle(
                                color: AppColors.light,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                              children: [
                                TextSpan(
                                  text: 'Date: ${barSpot.x.toInt()}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                                TextSpan(
                                  text: '\$${barSpot.y.toStringAsFixed(2)}',
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
                        getTooltipColor: (LineBarSpot barSpot) => AppColors.dark,
                      ),
                    ),
                    gridData: FlGridData(show: false),
                    titlesData: FlTitlesData(show: false),
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
                              AppColors.primary.withOpacity(0),
                            ],
                          ),
                          show: true,
                        ),
                        dotData: FlDotData(show: false),
                        spots: data.prices.map((e) => FlSpot(e.date, e.value)).toList(),
                      ),
                    ],
                    minX: 0,
                    maxX: data.prices.length.toDouble(),
                    // maxY: data.prices.maxY,
                    // minY: data.prices.minY,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}