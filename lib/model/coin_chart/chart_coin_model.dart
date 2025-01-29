import 'package:coindock_app/model/coin_chart/chart_point.dart';

class ChartData {
  final List<ChartPoint>prices;
  final List<ChartPoint>marketCaps;
  final List<ChartPoint>totalVolumes;

  ChartData({
    required this.prices,
    required this.marketCaps,
    required this.totalVolumes
  });

  factory ChartData.fromJson(Map<String, dynamic> data) {
    return ChartData(
      prices: (data['prices'] as List)
          .map((e) => ChartPoint.fromList(e))
          .toList(),
      marketCaps: (data['market_caps'] as List)
          .map((e) => ChartPoint.fromList(e))
          .toList(),
      totalVolumes: (data['total_volumes'] as List)
          .map((e) => ChartPoint.fromList(e))
          .toList(),
    );
  }
}