import 'package:intl/intl.dart';

class CurrencyEntity {
  final double real;
  final double dolar;
  final double euro;

  String get realFormated => _format(real);
  String get dolarFormated => _format(dolar);
  String get euroFormated => _format(euro);

  CurrencyEntity({
    required this.real,
    required this.dolar,
    required this.euro,
  });

  String _format(double value) {
    final formatter = NumberFormat.currency(symbol: '');
    return formatter.format(value);
  }
}
