import 'package:cryptoexchange/components/app_path.dart';

class StringHelper {
  /// write map function -> map coin image with image symbol
  /// example: BTCUSDT -> btc.png
  static String getCoinImage(String symbol) {
    if (symbol == "BTCUSDT") {
      return AppPath.icBitcoin;
    } else if (symbol == "ETHUSDT") {
      return AppPath.icEthereum;
    } else if (symbol == "BNBUSDT") {
      return AppPath.icBnb;
    } else if (symbol == "SOLUSDT") {
      return AppPath.icSolana;
    } else if (symbol == "ADAUSDT") {
      return AppPath.icAda;
    } else if (symbol == "XRPUSDT") {
      return AppPath.icXrp;
    } else if (symbol == "DOTUSDT") {
      return AppPath.icDot;
    } else if (symbol == "MATICUSDT") {
      return AppPath.icMati;
    } else if (symbol == "DOGEUSDT") {
      return AppPath.icDogecoin;
    } else if (symbol == "AVAXUSDT") {
      return AppPath.icAva;
    } else if (symbol == "LINKUSDT") {
      return AppPath.icLink;
    } else if (symbol == "LTCUSDT") {
      return AppPath.icLitecoin;
    } else if (symbol == "ATOMUSDT") {
      return AppPath.icAtom;
    } else if (symbol == "NEARUSDT") {
      return AppPath.icNear;
    } else if (symbol == "FILUSDT") {
      return AppPath.icFill;
    } else if (symbol == "UNIUSDT") {
      return AppPath.icUni;
    } else if (symbol == "TRXUSDT") {
      return AppPath.icTrx;
    } else if (symbol == "XLMUSDT") {
      return AppPath.icXlm;
    } else if (symbol == "APEUSDT") {
      return AppPath.icApe;
    } else {
      return AppPath.icEgld;
    }
  }
}
