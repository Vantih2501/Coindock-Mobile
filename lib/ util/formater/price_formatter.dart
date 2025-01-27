import 'package:intl/intl.dart';

String formatToIDR(double amount) {
  final formatter = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp ',
    decimalDigits: 0, 
  );
  return formatter.format(amount);
}

String formatToUSD(double amount) {
  final formatter = NumberFormat.currency(
    locale: 'en_US', 
    symbol: '\$', 
    decimalDigits: 2
  );
  return formatter.format(amount); 
}
