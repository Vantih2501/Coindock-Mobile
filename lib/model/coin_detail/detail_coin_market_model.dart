import 'package:coindock_app/model/coin_detail/image_model.dart';
import 'package:coindock_app/model/coin_detail/market_data_model.dart';

class DetailCoinMarket {
  final String id;
  final String? symbol;
  final String? name;
  final String? description;
  final ImageModel image;
  final MarketDataModel marketData;

  DetailCoinMarket({
    required this.id,
    required this.image,
    required this.marketData,
    this.symbol,
    this.name,
    this.description,
  });

   factory DetailCoinMarket.fromJson(Map<String, dynamic> json) {
     return DetailCoinMarket(
      id: json['id'] ?? '',
      symbol: json['symbol'] ?? '',
      name: json['name'] ?? 'unknown',
      description: json['description'] != null
        ? json['description']['en']
        : {},
      image: json['image'] != null 
        ? ImageModel.fromJson(json['image']) 
        : ImageModel(thumb: '', small: '', large: ''),
      marketData: json['market_data'] != null 
        ? MarketDataModel.fromJson(json['market_data']) 
        : MarketDataModel(currentPrice: {}),
     );
   }
}