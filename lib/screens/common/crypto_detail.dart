import 'package:coindock_app/model/coin_detail/detail_coin_market_model.dart';
import 'package:coindock_app/model/news_model.dart';
import 'package:coindock_app/screens/common/detail/screen_tabs/info_screen.dart';
import 'package:coindock_app/screens/common/detail/screen_tabs/news_screen.dart';
import 'package:coindock_app/screens/common/detail/screen_tabs/overview_screen.dart';
import 'package:coindock_app/service/coin_gecko_service/_coin_market.dart';
import 'package:coindock_app/service/news_service/_news_coin.dart';
import 'package:coindock_app/widgets/appbar/detailWithTab_appbar.dart';
import 'package:flutter/material.dart';

class CryptoDetailPage extends StatefulWidget {
  final String id;

  const CryptoDetailPage({super.key, required this.id});

  @override
  State<CryptoDetailPage> createState() => _CryptoDetailPageState();
}

class _CryptoDetailPageState extends State<CryptoDetailPage> {
  late Future<DetailCoinMarket> _cointMarket;
  late Future<List<News>> _newsByName;

  @override
  void initState() {
    super.initState();
    _cointMarket = ClassCoinMarket().getCoinMarketById(widget.id);
    _newsByName = ClassNews().getNewsByName(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, 
      child: Scaffold(
        appBar: DetailAppbarWithTab(
          title: 'Crypto Detail',
          tabs: const [
            Tab(text: "Overview"),
            Tab(text: "Info"),
            Tab(text: "News"),
          ],
        ),
        body: FutureBuilder<DetailCoinMarket>(
          future: _cointMarket,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData) {
              return const Center(child: Text('No data available'));
            } else {
              final coinData = snapshot.data!;
              return TabBarView(
                children: [
                  OverviewScreen(coin: coinData, listNews: _newsByName),
                  InfoScreen(),
                  NewsScreen(listNews: _newsByName, coinName: coinData.name!),
                ],
              );
            }
          },
        ),
      )
    );
  }
}