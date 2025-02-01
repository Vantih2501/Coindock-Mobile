import 'package:flutter_dotenv/flutter_dotenv.dart';

class Config {

  // CoinGecko
  static String? baseUrlCG = dotenv.env['BASE_URL_COIN_GECKO'];
  static String? apiKeyCG = dotenv.env['API_KEY_COIN_GECKO'];

  // News API
  static String? baseUrlNews = dotenv.env['BASE_URL_NEWS'];
  static String? apiKeyNews = dotenv.env['API_KEY_NEWS'];

  // Paymoon API
  static String? baseUrlMoonpay = dotenv.env['BASE_URL_MOONPAY'];
  static String? apiKeyMoonPaySecret = dotenv.env['HM_ACCESS_KEY_SECRET'];
  static String? apiKeyMoonPay = dotenv.env['HM_ACCESS_KEY_SECRET'];
}