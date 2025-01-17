import 'package:coindock_app/model/source_model.dart';

class News {
  final String title;
  final Source source;
  final String? author;
  final String description;
  final String content;
  final String url;
  final String? urlToImage;
  final DateTime publishedAt;

  News({
    required this.title,
    required this.source,
    required this.description,
    required this.content,
    required this.url,
    required this.publishedAt,
    this.author,
    this.urlToImage,
  });

  factory News.fromJson(Map<String, dynamic> data) {
  return News(
    title: data['title'] ?? 'No Title',
    source: data['source'] != null
        ? Source.fromJson(data['source'])
        : Source(id: null, name: 'Unknown Source'),
    author: data['author'] ?? 'Unknown Author',
    description: data['description'] ?? 'No Description',
    content: data['content'] ?? 'No Content',
    url: data['url'] ?? 'No URL',
    urlToImage: data['urlToImage'] ?? 'assets/images/empty.png', 
    publishedAt: data['publishedAt'] != null
        ? DateTime.parse(data['publishedAt'])
        : DateTime.now(), 
  );
}
}