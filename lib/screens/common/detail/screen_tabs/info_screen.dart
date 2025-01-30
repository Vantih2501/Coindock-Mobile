import 'package:coindock_app/%20util/constants/colors.dart';
import 'package:coindock_app/%20util/formater/price_formatter.dart';
import 'package:coindock_app/model/coin_detail/detail_coin_market_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class InfoScreen extends StatelessWidget {
  final DetailCoinMarket data;

  const InfoScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
          child: Text('Information Detail', 
          style: TextStyle(
            fontSize: 16, 
            fontWeight: FontWeight.w600, 
            color: AppColors.dark
            )),
        ),
        SizedBox(height: 4),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Html(
            data: data.description ?? 'No description available',
            style: {
              "body": Style(
                fontSize: FontSize(14),
                lineHeight: LineHeight.number(1.2),
              ),
              "p": Style(
                margin: Margins.only(bottom: 10),
              ),
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: _informationSection(),
        ),
      ],
    );
  }

  Column _informationSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Information',
          style: TextStyle(
            fontSize: 16, 
            fontWeight: FontWeight.w600, 
            color: AppColors.dark
            )
          ),
          SizedBox(height: 16),
          Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             _infoContainer('Market capital', '\$${formatToUSD(data.marketData.marketCap!['usd']!).toString()}'),
            SizedBox(height: 14),
            _infoContainer('Total supply', formatToUSD(data.marketData.totalSupply!).toString()),
            SizedBox(height: 14),
            _infoContainer('Circulating supply', formatToUSD(data.marketData.circulatingSupply!).toString()),
            SizedBox(height: 14),
            _infoContainer('Watchlist users', '${data.watchlistPortfolioUsers}'),
        ])
      ],
    );
  }

  Row _infoContainer(String title, String value) {
    return Row(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14, 
              fontWeight: FontWeight.w400, 
              color: AppColors.text200
              )
            ),
            const Spacer(),
            Text(
              value,
              style: TextStyle(
                fontSize: 14, 
                fontWeight: FontWeight.w500, 
                color: AppColors.dark
                )
              )
      ]);
  }
}