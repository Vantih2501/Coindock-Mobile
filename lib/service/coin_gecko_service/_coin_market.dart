import 'package:coindock_app/model/coin_chart/chart_coin_model.dart';
import 'package:coindock_app/model/coin_detail/detail_coin_market_model.dart';
import 'package:coindock_app/model/coin_market_model.dart';
import 'package:coindock_app/service/dio_client_service/_dio_client.dart';
import 'package:flutter/material.dart';

class ClassCoinMarket {
  final dio = DioClient().dioCoinGecko;

  Future<List<CoinMarket>> getCoinMarket({String currency = 'usd'}) async {
    try {
      final response = await dio.get('/coins/markets', queryParameters: {'vs_currency': currency});
      List<CoinMarket> coinMarketList = (response.data as List).map((coin) => CoinMarket.fromJson(coin)).toList();

      return coinMarketList;
    } catch (e) {
      debugPrint('Error fetching data: $e');
      throw Exception('Failed to fetch coin market data');
    }
  }

  Future<DetailCoinMarket> getCoinMarketById(String id) async {
  try {
    final response = await dio.get('/coins/$id');
    DetailCoinMarket coinMarketData = DetailCoinMarket.fromJson(response.data);
    return coinMarketData;
  } catch (e) {
    debugPrint('Error fetching data: $e');
    throw Exception('Failed to fetch coin market data');
    }
  }

  Future<ChartData> getCoinMarketChart({String currency = 'usd', int days = 7, required String id}) async {
    try {
      final response = await dio.get('/coins/$id/market_chart', queryParameters: {
        'vs_currency': currency, 
        'days': days.toString()
      });
      ChartData coinChartData = ChartData.fromJson(response.data);
      return coinChartData;
    } catch (e) {
      debugPrint('Error fetching data: $e');
      throw Exception('Failed to fetch coin market chart data');
    }
  }
}