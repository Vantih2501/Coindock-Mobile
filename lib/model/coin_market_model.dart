class CoinMarket {
  final String id;
  final String symbol;
  final String name;
  final String image;
  final double current_price;
  final double market_cap;
  final double ath_change_percentage;

  CoinMarket({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.current_price,
    required this.market_cap,
    required this.ath_change_percentage
  });
  
  factory CoinMarket.fromJson(Map<String, dynamic> data) {
    return CoinMarket(
      id: data['id'], 
      symbol: data['symbol'], 
      name: data['name'], 
      image: data['image'], 
      current_price: data['current_price'].toDouble(), 
      market_cap: data['market_cap'].toDouble(),
      ath_change_percentage: data['ath_change_percentage'],
    );
  }
}
