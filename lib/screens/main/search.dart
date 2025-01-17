import 'package:coindock_app/%20util/constants/colors.dart';
import 'package:coindock_app/model/coin_market_model.dart';
import 'package:coindock_app/model/news_model.dart';
import 'package:coindock_app/service/coin_gecko_service/_coin_market.dart';
import 'package:coindock_app/service/news_service/_news_coin.dart';
import 'package:coindock_app/widgets/card/_card.dart';
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
  late Future<List<News>> _news;

  @override
  void initState() {
    super.initState();
    _fetchCoinMarket();
    _fetchNews();
  }

  void _fetchCoinMarket() async {
    _coints = ClassCoinMarket().getCoinMarket();
  }

  void _fetchNews() async {
    _news = ClassNews().getNews();
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
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                      height: 197,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: AppColors.light
                      ),
                    ),
                    FutureBuilder<List<News>>(
                      future: _news,
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
