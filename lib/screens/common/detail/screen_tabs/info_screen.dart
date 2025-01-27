import 'package:coindock_app/%20util/constants/colors.dart';
import 'package:coindock_app/model/coin_detail/detail_coin_market_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class InfoScreen extends StatelessWidget {
  final DetailCoinMarket data;

  const InfoScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ListView(
        children: [
          Text('Information Detail', 
          style: TextStyle(
            fontSize: 16, 
            fontWeight: FontWeight.w600, 
            color: AppColors.dark
            )),
          Html(
            data: data.description
          )
        ],
      ),
    );
  }
}