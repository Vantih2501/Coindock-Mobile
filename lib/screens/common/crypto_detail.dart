import 'package:coindock_app/screens/common/detail/screen_tabs/info_screen.dart';
import 'package:coindock_app/screens/common/detail/screen_tabs/news_screen.dart';
import 'package:coindock_app/screens/common/detail/screen_tabs/overview_screen.dart';
import 'package:coindock_app/widgets/appbar/detailWithTab_appbar.dart';
import 'package:flutter/material.dart';

class CryptoDetailPage extends StatelessWidget {
  final String id;

  const CryptoDetailPage({super.key, required this.id});

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
        body: const TabBarView(
          children: [
            OverviewScreen(),
            InfoScreen(),
            NewsScreen(),
          ],
        ),
      )
    );
  }
}