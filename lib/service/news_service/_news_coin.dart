import 'package:coindock_app/model/news_model.dart';
import 'package:coindock_app/service/dio_client_service/_dio_client.dart';
import 'package:flutter/material.dart';

class ClassNews {
  final dio = DioClient().dioNewsApi;

 Future<List<News>> getNews() async {
  try {
    final response = await dio.get('/everything?q=crypto*');

    if (response.statusCode == 200) {

      List<dynamic> articles = response.data['articles'];
      List<News> newsData = articles.map((news) => News.fromJson(news)).toList();
      List<News> filteredNews = newsData
          .where((news) => news.urlToImage != null && news.urlToImage!.startsWith('http'))
          .toList();

      return filteredNews; 
    } else {
      throw Exception('Failed to load news');
    }
  } catch (e) {
    debugPrint('Error fetching data: $e');
    throw Exception('Failed to fetch news data');
  }
}

 Future<List<News>> getRecentNews() async {
  try {
    final response = await dio.get('/everything?q=crypto*&sortBy=publishedAt');

    if (response.statusCode == 200) {

      List<dynamic> articles = response.data['articles'];
      List<News> newsData = articles.map((news) => News.fromJson(news)).toList();
      List<News> filteredNews = newsData
          .where((news) => news.urlToImage != null && news.urlToImage!.startsWith('http'))
          .toList();

      return filteredNews; 
    } else {
      throw Exception('Failed to load news');
    }
  } catch (e) {
    debugPrint('Error fetching data: $e');
    throw Exception('Failed to fetch news data');
  }
}


  Future<List<News>> getHottestNews() async {
    try {
      final response = await dio.get('/everything?q=crypto*&sortBy=popularity');

      if (response.statusCode == 200) {
        List<dynamic> articles = response.data['articles'];
        List<News> newsData = articles.map((news) => News.fromJson(news)).toList();
        List<News> filteredNews = newsData
            .where((news) => news.urlToImage != null && news.urlToImage!.startsWith('http'))
            .toList();
        return filteredNews;
      } else {
        throw Exception('Failed to load news');
      }
    } catch (e) {
      debugPrint('Error fetching data: $e');
      throw Exception('Failed to fetch news data');
    }
  }

  Future<List<News>> getNewsByName(String coin) async {
    try {
      final response = await dio.get('/everything?q=$coin*&sortBy=publishedAt');

      if (response.statusCode == 200) {
        List<dynamic> articles = response.data['articles'];
        List<News> newsData = articles.map((news) => News.fromJson(news)).toList();
        List<News> filteredNews = newsData
            .where((news) => news.urlToImage != null && news.urlToImage!.startsWith('http'))
            .toList();
        return filteredNews;
      } else {
        throw Exception('Failed to load news');
      }
    } catch (e) {
      debugPrint('Error fetching data: $e');
      throw Exception('Failed to fetch news data');
    }
  }

  

}