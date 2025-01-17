import 'package:coindock_app/%20util/constants/config.dart';
import 'package:dio/dio.dart';

class DioClient {
  static final DioClient _instance = DioClient._internal();
  late final Dio dioCoinGecko;
  late final Dio dioNewsApi;

  factory DioClient() => _instance;

  DioClient._internal() {
    dioCoinGecko = Dio(BaseOptions(
      baseUrl: Config.baseUrlCG!,
      connectTimeout: Duration(milliseconds: 5000),
      receiveTimeout: Duration(milliseconds: 3000),
      headers: {
        'accept': 'application/json',
        'x-cg-demo-api-key': Config.baseUrlCG
      }
    ));

    dioNewsApi = Dio(BaseOptions(
      baseUrl: Config.baseUrlNews!,
      connectTimeout: Duration(milliseconds: 5000),
      receiveTimeout: Duration(milliseconds: 3000),
      headers: {
        'X-Api-Key': Config.apiKeyNews
      }
    ));
  }
}