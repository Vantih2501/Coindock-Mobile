class CoinMarket {
  final String id;
  final String symbol;
  final String name;
  final String image;
  final double currentPrice;
  final double marketCap;
  final double? priceChangePercentage24h;

  CoinMarket({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.currentPrice,
    required this.marketCap,
    this.priceChangePercentage24h
  });
  
  factory CoinMarket.fromJson(Map<String, dynamic> data) {
    return CoinMarket(
      id: data['id'], 
      symbol: data['symbol'], 
      name: data['name'], 
      image: data['image'], 
      currentPrice: data['current_price'].toDouble(), 
      marketCap: data['market_cap'].toDouble(),
      priceChangePercentage24h: data['price_change_percentage_24h'] != null ? data['price_change_percentage_24h'].toDouble() : 0.0,
    );
  }
}
