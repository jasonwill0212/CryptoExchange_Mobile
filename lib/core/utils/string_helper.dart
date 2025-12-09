import 'package:cryptoexchange/components/app_path.dart';

class StringHelper {
  /// write map function -> map coin image with image symbol
  /// example: BTCUSDT -> btc.png
  String getCoinImage(String symbol) {
    if (symbol == "BTCUSDT") {
      return AppPath.icCoppy;
    } else if (symbol == "ETHUSDT") {
      return AppPath.icCoppy;
    } else if (symbol == "BNBUSDT") {
      return AppPath.icCoppy;
    } else if (symbol == "XRPUSDT") {
      return AppPath.icCoppy;
    } else if (symbol == "ADAUSDT") {
      return AppPath.icCoppy;
    } else if (symbol == "SOLUSDT") {
      return AppPath.icCoppy;
    } else if (symbol == "DOGEUSDT") {
      return AppPath.icCoppy;
    } else if (symbol == "DOTUSDT") {
      return AppPath.icCoppy;
    } else if (symbol == "MATICUSDT") {
      return AppPath.icCoppy;
    } else {
      return AppPath.icCoppy; // default image
    }
  }
}
