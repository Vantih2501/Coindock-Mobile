import 'package:coindock_app/model/news_model.dart';
import 'package:coindock_app/service/dio_client_service/_dio_client.dart';
import 'package:flutter/material.dart';

class ClassNews {
  final dio = DioClient().dioNewsApi;

  Future<List<News>> getNews() async {
    try {
      final response = await dio.get('/everything?q=bitcoin');

      if (response.statusCode == 200) {
        List<dynamic> articles = response.data['articles'];
        // debugPrint('Articles data: $articles');
        List<News> newsData = articles.map((news) => News.fromJson(news)).toList();
        // debugPrint('News data: $newsData');
        return newsData;
      } else {
        throw Exception('Failed to load news');
      }
    } catch (e) {
      debugPrint('Error fetching data: $e');
      throw Exception('Failed to fetch news data');
    }
  }
}