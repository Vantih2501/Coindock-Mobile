import 'package:coindock_app/%20util/constants/colors.dart';
import 'package:coindock_app/model/coin_market_model.dart';
import 'package:coindock_app/service/coin_gecko_service/_coin_market.dart';
import 'package:coindock_app/widgets/appbar/main_appbar.dart';
import 'package:coindock_app/widgets/card/_card.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class MarketPage extends StatefulWidget {
  const MarketPage({super.key});

  @override
  State<MarketPage> createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage> {
  late Future<List<CoinMarket>> _coints;

  String selectedValue = 'usd';
  final List<String> items = ['USD', 'IDR'];

  @override
  void initState() {
    super.initState();
    _fetchCoinMarket();
  }

  void _fetchCoinMarket() async {
    _coints = ClassCoinMarket().getCoinMarket(currency: selectedValue);
  }

  @override
 Widget build(BuildContext context) {
  return Scaffold(
    body: Column(
      children: [
        MainAppBar(),
        _header(),
        SizedBox(height: 8),  
        Expanded(
          child: FutureBuilder<List<CoinMarket>>(
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
                  itemCount: coinData?.length ?? 0,
                  itemBuilder: (context, index) { 
                    final coin = coinData?[index];
                    return CryptoCard(data: coin!, currency: selectedValue);
                  },
                );
              }
            },
          ),
        ),
      ],
    ),
  );
}

  Container _header() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.text100, width: 1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text('#', style: TextStyle(fontWeight: FontWeight.w600, color: AppColors.text200)),
            ),
            SizedBox(width: 16),
            Text('Coin', style: TextStyle(fontWeight: FontWeight.w600, color: AppColors.text200)),
          ]),
          Text('Market Cap', style: TextStyle(fontWeight: FontWeight.w600, color: AppColors.text200)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text('Price', style: TextStyle(fontWeight: FontWeight.w600, color: AppColors.text200)),
            SizedBox(width: 8),
            SizedBox(
              height: 20,
              child: DropdownButton<String>(
                style: TextStyle(color: AppColors.text300, fontWeight: FontWeight.w600),
                itemHeight: 50,
                dropdownColor: Colors.white,
                borderRadius: BorderRadius.circular(8),
                value: items.contains(selectedValue.toUpperCase()) ? selectedValue.toUpperCase() : items.first,
                items: items.map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Row(
                      children: [
                        Text(item),
                        SizedBox(width: 4),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (String? value) {
                  if (value != null) {
                    setState(() {
                      selectedValue = value.toLowerCase();
                      _fetchCoinMarket();
                    });
                  }
                },
                icon: Icon(LucideIcons.chevronDown, size: 16),
              ),
            )
          ])
        ]
      ),
    );
  }
}
