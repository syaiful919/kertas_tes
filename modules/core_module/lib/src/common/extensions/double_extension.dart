import 'package:third_parties_module/intl.dart';

extension DoubleExtension on double {
  String currency({
    String code = "id_ID",
    String symbol = 'Rp ',
    int decimalDigits = 0,
  }) {
    final currencyFormatter = NumberFormat.currency(
      locale: code,
      symbol: symbol,
      decimalDigits: decimalDigits,
    );
    return currencyFormatter.format(this);
  }
}
