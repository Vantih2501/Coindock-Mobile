import 'package:coindock_app/model/coin_market_model.dart';
import 'package:coindock_app/screens/common/detail/screen_tabs/info_screen.dart';
import 'package:coindock_app/screens/common/detail/screen_tabs/news_screen.dart';
import 'package:coindock_app/screens/common/detail/screen_tabs/overview_screen.dart';
import 'package:coindock_app/service/coin_gecko_service/_coin_market.dart';
import 'package:coindock_app/widgets/appbar/detailWithTab_appbar.dart';
import 'package:flutter/material.dart';

class CryptoDetailPage extends StatefulWidget {
  final String id;

  const CryptoDetailPage({super.key, required this.id});

  @override
  State<CryptoDetailPage> createState() => _CryptoDetailPageState();
}

class _CryptoDetailPageState extends State<CryptoDetailPage> {
  late Future<CoinMarket> _cointMarket;
  // late Future<CoinMarket> _newsByName;

  @override
  void initState() {
    super.initState();
    debugPrint('CryptoDetailPage id: ${widget.id}');
    _cointMarket = ClassCoinMarket().getCoinMarketById(widget.id);
    // _newsByName = ClassNews().getNewsByName(_coint.name);
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
        body: FutureBuilder<CoinMarket>(
          future: _cointMarket,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData) {
              return const Center(child: Text('No data available'));
            } else {
              final coin = snapshot.data!;
              return TabBarView(
                children: [
                  OverviewScreen(coin: coin),
                  InfoScreen(),
                  NewsScreen(),
                ],
              );
            }
          },
        ),
      )
    );
  }
}