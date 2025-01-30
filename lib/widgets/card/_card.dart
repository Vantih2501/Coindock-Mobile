import 'package:coindock_app/%20util/constants/colors.dart';
import 'package:coindock_app/%20util/formater/price_formatter.dart';
import 'package:coindock_app/model/coin_market_model.dart';
import 'package:coindock_app/screens/common/crypto_detail.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class CryptoCard extends StatelessWidget {
  final CoinMarket data;
  final String? currency;

  const CryptoCard({super.key, required this.data, this.currency});

  @override
  Widget build(BuildContext context) {
    final isPriceUp = data.priceChangePercentage24h! > 0;

    return ElevatedButton(
      onPressed: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CryptoDetailPage(id: data.id)),
        );
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(0),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black12,
        shadowColor: Colors.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
              Container(
                width: 32, 
                height: 32, 
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Image.network(data.image, fit: BoxFit.cover),
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data.name, style: TextStyle(fontSize: 14 ,fontWeight: FontWeight.w600, color: AppColors.dark)),
                  Text(data.symbol.toUpperCase(), style: TextStyle(color: AppColors.text100)),
                ],
              ),
            ]),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  currency == 'idr' ? formatToIDR(data.currentPrice) : '\$${formatToUSD(data.currentPrice)}',
                  style: TextStyle(
                    fontSize: 14, 
                    fontWeight: FontWeight.w600, 
                    color: AppColors.dark
                  )),
                Row(
                  children: [
                    Icon(
                      isPriceUp
                          ? LucideIcons.trendingUp
                          : LucideIcons.trendingDown,
                      color: isPriceUp
                          ? Colors.green.shade300
                          : Colors.red.shade300,
                      size: 20,
                    ),
                    SizedBox(width: 4),
                    Text(
                      '${data.priceChangePercentage24h!.toStringAsFixed(2)}%',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: isPriceUp
                            ? Colors.green.shade300
                            : Colors.red.shade300,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ]
        ),
      ),
    );
  }
}
