import 'package:coindock_app/%20util/constants/colors.dart';
import 'package:coindock_app/%20util/formater/price_formatter.dart';
import 'package:coindock_app/model/coin_detail/detail_coin_market_model.dart';
import 'package:coindock_app/model/news_model.dart';
import 'package:coindock_app/widgets/card/_card_news_title.dart';
import 'package:coindock_app/widgets/charts/line_charts.dart';
import 'package:flutter/material.dart';

class OverviewScreen extends StatefulWidget {  
  final DetailCoinMarket coin;
  final Future<List<News>> listNews;

  const OverviewScreen({super.key, required this.coin, required this.listNews});

  @override
  State<OverviewScreen> createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  String activeButton = '';

  @override
  Widget build(BuildContext context) {
  final isPriceUp = widget.coin.marketData.priceChange24hInCurrency!['usd']! > 0;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: [
            _priceInfo(isPriceUp),
            SizedBox(height: 12),
            LineChartCard(),
            _filterSection(),
            SizedBox(height: 32),
            _descriptionSection(),
            SizedBox(height: 20),
            _informationSection(),
            SizedBox(height: 24),
            _newsSection()
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        height: 70,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: (){

          },
          child: const Text('Buy Coin', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14, color: Colors.white)),
        ),
      )
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
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.light, width: 1)
            ),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _infoContainer('Market capital', formatToUSD(widget.coin.marketData.marketCap!['usd']!).toString()),
              SizedBox(height: 14),
              _infoContainer('Total supply', '${widget.coin.marketData.totalSupply}'),
              SizedBox(height: 14),
              _infoContainer('Circulating supply', '${widget.coin.marketData.circulatingSupply}'),
              SizedBox(height: 14),
              _infoContainer('Watchlist users', '${widget.coin.marketData.watchlistPortfolioUsers}'),
          ])
          )
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

  Column _newsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${widget.coin.name} News', 
          style: TextStyle(
            fontSize: 16, 
            fontWeight: FontWeight.w600, 
            color: AppColors.dark
            )
          ),
        SizedBox(height: 16),
        SizedBox(
          height: 254,
          child: FutureBuilder(
            future: widget.listNews, 
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData) {
                return const Center(child: Text('No data available'));
              } else {
                final newsData = snapshot.data as List;
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: newsData.length,
                  itemBuilder: (context, index) {
                    final news = newsData[index];
                    return (
                      newsData.isEmpty
                      ? SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 254,
                          child: Image.asset('assets/images/empty.png'),
                        )
                      : Row(
                          children: [
                            CardNewsTitle(data: news),
                            SizedBox(width: 20),
                          ]
                        )
                    );
                  },
                );
              } 
            }
          )
        ),
      ],
    );
  }

  Column _descriptionSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.dark 
          ),
        ),
        SizedBox(height: 12),
        Text(
          widget.coin.description ?? 'No description available',
          maxLines: 7,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w400,
            color: AppColors.text300 
          ),
        )
      ],
    );
  }

  Container _filterSection() {
    return Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.light
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buttonFilter('1H'),
                  _buttonFilter('1D'),
                  _buttonFilter('1M'),
                  _buttonFilter('1Y'),
                  _buttonFilter('ALL'),
                ]
              )
            );
  }

  SizedBox _buttonFilter(String title) {
    bool isSelected = activeButton == title;

    return SizedBox(
      height: 32,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: isSelected ? AppColors.primary : AppColors.light,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),  // Correct way to apply border radius
          ),
        ),
        onPressed: () {
          setState(() {
            activeButton = isSelected ? '' : title;
          });
        },
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: isSelected ? Colors.white : AppColors.text300
            ),
          ),
        ),
      ),
    );
  }

  Column _priceInfo(isPriceUp) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${widget.coin.name} Price',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.text200)),
            SizedBox(height: 2),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '\$${widget.coin.marketData.currentPrice['usd']!.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: AppColors.dark)),
            SizedBox(width: 12),
            Text(
            isPriceUp
                ? '▲ ${widget.coin.marketData.priceChangePercentage24hInCurrency?['usd']!.toStringAsFixed(2)}%'
                : '▼ ${widget.coin.marketData.priceChangePercentage24hInCurrency?['usd']!.toStringAsFixed(2)}%',
            style: TextStyle(
              fontSize: 16,
              color: isPriceUp ? Colors.green.shade400 : Colors.red.shade400,
            ),
          ),
          ],
        )
      ],
    );
  }
}