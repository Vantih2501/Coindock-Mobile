class MarketDataModel {
  final Map<String, double> currentPrice;
  final double? priceChange24h;
  final double? priceChangePercentage24h;
  final double? priceChangePercentage7d;
  final double? priceChangePercentage14d;
  final double? priceChangePercentage30d;
  final double? priceChangePercentage60d;
  final double? priceChangePercentage200d;
  final double? priceChangePercentage1y;
  final Map<String, double>? priceChange24hInCurrency;
  final Map<String, double>? priceChangePercentage1hInCurrency;
  final Map<String, double>? priceChangePercentage24hInCurrency;
  final Map<String, double>? priceChangePercentage30hInCurrency;
  final Map<String, double>? priceChangePercentage1yInCurrency;
  final Map<String, double>? marketCap;
  final double? marketCapRank;
  final double? totalSupply;
  final double? circulatingSupply;
  final double? watchlistPortfolioUsers;

  MarketDataModel({
    required this.currentPrice,
    this.priceChange24h,
    this.priceChangePercentage24h,
    this.priceChangePercentage7d,
    this.priceChangePercentage14d,
    this.priceChangePercentage30d,
    this.priceChangePercentage60d,
    this.priceChangePercentage200d,
    this.priceChangePercentage1y,
    this.priceChange24hInCurrency,
    this.priceChangePercentage1hInCurrency,
    this.priceChangePercentage24hInCurrency,
    this.priceChangePercentage30hInCurrency,
    this.priceChangePercentage1yInCurrency,
    this.marketCap,
    this.marketCapRank,
    this.totalSupply,
    this.circulatingSupply,
    this.watchlistPortfolioUsers,
  });

  factory MarketDataModel.fromJson(Map<String, dynamic> json) {
    return MarketDataModel(
      currentPrice: (json['current_price'] as Map<dynamic, dynamic>?)
              ?.map((key, value) => MapEntry(key.toString(), (value as num?)?.toDouble() ?? 0.0)) ?? {},
      priceChange24h: (json['price_change_24h'] as num?)?.toDouble() ?? 0.0,
      priceChangePercentage24h: (json['price_change_percentage_24h'] as num?)?.toDouble() ?? 0.0,
      priceChangePercentage7d: (json['price_change_percentage_7d'] as num?)?.toDouble() ?? 0.0,
      priceChangePercentage14d: (json['price_change_percentage_14d'] as num?)?.toDouble() ?? 0.0,
      priceChangePercentage30d: (json['price_change_percentage_30d'] as num?)?.toDouble() ?? 0.0,
      priceChangePercentage60d: (json['price_change_percentage_60d'] as num?)?.toDouble() ?? 0.0,
      priceChangePercentage200d: (json['price_change_percentage_200d'] as num?)?.toDouble() ?? 0.0,
      priceChangePercentage1y: (json['price_change_percentage_1y'] as num?)?.toDouble() ?? 0.0,
      priceChange24hInCurrency: (json['price_change_24h_in_currency'] as Map<dynamic, dynamic>?)
              ?.map((key, value) => MapEntry(key.toString(), (value as num?)?.toDouble() ?? 0.0 )),
      priceChangePercentage1hInCurrency: (json['price_change_percentage_1h_in_currency'] as Map<dynamic, dynamic>?)
              ?.map((key, value) => MapEntry(key.toString(), (value as num?)?.toDouble() ?? 0.0 )),
      priceChangePercentage24hInCurrency: (json['price_change_percentage_24h_in_currency'] as Map<dynamic, dynamic>?)
              ?.map((key, value) => MapEntry(key.toString(), (value as num?)?.toDouble() ?? 0.0 )),
      priceChangePercentage30hInCurrency: (json['price_change_percentage_30h_in_currency'] as Map<dynamic, dynamic>?)
              ?.map((key, value) => MapEntry(key.toString(), (value as num?)?.toDouble() ?? 0.0 )),
      priceChangePercentage1yInCurrency: (json['price_change_percentage_1y_in_currency'] as Map<dynamic, dynamic>?)
              ?.map((key, value) => MapEntry(key.toString(), (value as num?)?.toDouble() ?? 0.0 )),
      marketCap: (json['market_cap'] as Map<dynamic, dynamic>?)?.map((key, value) => MapEntry(key.toString(), (value as num?)?.toDouble() ?? 0.0 )) ?? {},
      marketCapRank: (json['market_cap_rank'] as num?)?.toDouble() ?? 0.0,
      totalSupply: (json['total_supply'] as num?)?.toDouble() ?? 0.0,
      circulatingSupply: (json['circulating_supply'] as num?)?.toDouble() ?? 0.0,
      watchlistPortfolioUsers: json['watchlist_portfolio_users'].toDouble() ?? 0.0
    );
  }
}
