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
      print('Error fetching data: $e');
      throw Exception('Failed to fetch coin market data');
    }
  }

  // Future<List<CoinMarket>> getTrendingCoinMarket() async {
  //   try {
  //     final response = await dio.get('/search/trending');
  //     List<CoinMarket> coinMarketList = (response.data.coins as List).map((coin) => CoinMarket.fromJson(coin)).toList();
  //     return coinMarketList;
  //   } catch (e) {
  //     debugPrint('Error fetching data: $e');
  //     throw Exception('Failed to fetch coin market data');
  //   }
  // }

  Future<List<CoinMarket>> getCoinMarketById(String id) async {
    try {
      final response = await dio.get('/coins/$id');
      List<CoinMarket> coinMarketList = (response.data as List).map((coin) => CoinMarket.fromJson(coin)).toList();

      return coinMarketList;
    } catch (e) {
      debugPrint('Error fetching data: $e');
      throw Exception('Failed to fetch coin market data');
    }
  }
}