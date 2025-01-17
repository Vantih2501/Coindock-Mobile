import 'package:coindock_app/%20util/constants/colors.dart';
import 'package:coindock_app/model/news_model.dart';
import 'package:coindock_app/service/news_service/_news_coin.dart';
import 'package:coindock_app/widgets/appbar/main_appbar.dart';
import 'package:coindock_app/widgets/card/_card_fill_news_card.dart';
import 'package:coindock_app/widgets/card/_card_news.dart';
import 'package:coindock_app/widgets/card/_card_news_title.dart';
import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  late Future<List<News>> _hottestNews;
  late Future<List<News>> _recentNews;
  late Future<List<News>> _news;

  @override
  void initState() {
    super.initState();
    _recentNews = ClassNews().getRecentNews();
    _news = ClassNews().getNews();
    _hottestNews = ClassNews().getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          MainAppBar(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _hottestNewsSection(),
                      SizedBox(height: 8),
                      _recentNewsSection(),
                      SizedBox(height: 24),
                      _ourNews(),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Column _hottestNewsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text('Hottest News', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.dark)),
        ),
        FutureBuilder(
          future: _hottestNews,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || (snapshot.data as List).isEmpty) {
              return Center(child: Text('No data available'));
            } else {
              final hottestNewsData = snapshot.data as List; 
              return SizedBox(
                height: 220,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: hottestNewsData.length,
                  itemBuilder: (context, index) {
                    final news = hottestNewsData[index];
                    return FillNewsCard(data: news);
                  },
                ),
              );
            }
          },
        ),
        SizedBox(height: 8),
      ],
    );
  }

  Column _recentNewsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          'Recent News', 
          style: TextStyle(
            fontSize: 16, 
            fontWeight: FontWeight.w700, 
            color: AppColors.dark
            )
          )
        ),
        SizedBox(height: 16),
        SizedBox(
          height: 245,
          child: FutureBuilder(
          future: _recentNews,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || (snapshot.data as List).isEmpty) {
              return Center(child: Text('No data available'));
            } else {
              final recentNewsData = snapshot.data as List; 
              return SizedBox(
                height: 220,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: recentNewsData.length,
                  itemBuilder: (context, index) {
                    final news = recentNewsData[index];
                    return Row(
                      children: [
                        SizedBox(width: 20),
                        CardNewsTitle(data: news),
                      ],
                    );
                  },
                ),
              );
            }
          },
        ),
        )
      ],
    );
  }

  Column _ourNews() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          'Our News', 
          style: TextStyle(
            fontSize: 16, 
            fontWeight: FontWeight.w700, 
            color: AppColors.dark
            )
          )
        ),
        SizedBox(height: 8),
        FutureBuilder(
          future: _news,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || (snapshot.data as List).isEmpty) {
              return Center(child: Text('No data available'));
            } else {
              final ourNewsData = snapshot.data as List; 
              return SizedBox(
                height: 220,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  primary: false,
                  itemCount: ourNewsData.length,
                  itemBuilder: (context, index) {
                    final news = ourNewsData[index];
                    return NewsCard(data: news);
                  },
                ),
              );
            }
          },
        ),
      ],
    );
  }
}


