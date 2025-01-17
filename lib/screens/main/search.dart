import 'package:coindock_app/%20util/constants/colors.dart';
import 'package:coindock_app/model/coin_market_model.dart';
import 'package:coindock_app/model/news_model.dart';
import 'package:coindock_app/service/coin_gecko_service/_coin_market.dart';
import 'package:coindock_app/service/news_service/_news_coin.dart';
import 'package:coindock_app/widgets/card/_card.dart';
import 'package:coindock_app/widgets/card/_card_fill_news_card.dart';
import 'package:coindock_app/widgets/card/_card_news.dart';
import 'package:coindock_app/widgets/search/_search.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late Future<List<CoinMarket>> _coints;
  late Future<List<News>> _recentNews;
  late Future<List<News>> _hottestNews;

  @override
  void initState() {
    super.initState();
    _coints = ClassCoinMarket().getCoinMarket();
    _recentNews = ClassNews().getRecentNews();
    _hottestNews = ClassNews().getHottestNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(20),
            child: AppSearch()
          ),
          Expanded(
            child: ListView(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text('Popular', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.dark)),
                ),
                _popularSection(),
                SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text('Hottest News', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.dark)),
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
                          final hottestNewsData = snapshot.data as List; // Cast to the correct type
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text('Recent News', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.dark)),
                    ),
                    FutureBuilder<List<News>>(
                      future: _recentNews,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(child: Text('Error: ${snapshot.error}'));
                        } else if (!snapshot.hasData) {
                          return Center(child: Text('Not data available'));
                        } else {
                          final newsData = snapshot.data;
                          return ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: newsData?.length ?? 0,
                            itemBuilder: ( context, index ) {
                              final news = newsData?[index];
                              if (news == null) return null;
                              return NewsCard(data: news);
                            },
                          );
                        }
                      }
                    )
                  ],
                )
              ]
            ),
          )
        ],
      ),
    );
  }

  FutureBuilder _popularSection() {
    return FutureBuilder<List<CoinMarket>>(
      future: _coints,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData) {
          return Center(child: Text('Not data available'));
        } else {
          final coinData = snapshot.data;
          return ListView.builder(
            shrinkWrap: true,
            itemCount: coinData != null ? 5 : 0,
            itemBuilder: (context, index) {
              return CryptoCard(data: coinData![index], currency: 'usd');
            } 
          );
        } 
      },
    );
  }
}


