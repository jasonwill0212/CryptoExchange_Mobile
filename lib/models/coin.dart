// {
//     "e": "24hrTicker",
//     "E": 1764769606034,
//     "s": "BTCUSDT",
//     "p": "5603.81000000",
//     "P": "6.401",
//     "w": "91577.01401204",
//     "x": "87550.90000000",
//     "c": "93154.70000000",
//     "Q": "0.00061000",
//     "b": "93154.69000000",
//     "B": "3.85488000",
//     "a": "93154.70000000",
//     "A": "0.05126000",
//     "o": "87550.89000000",
//     "h": "93958.58000000",
//     "l": "87484.42000000",
//     "v": "30605.83153000",
//     "q": "2802790662.87291550",
//     "O": 1764683206007,
//     "C": 1764769606007,
//     "F": 5594626378,
//     "L": 5601716678,
//     "n": 7090301,
//.    "symbol_name": "Bitcoin/USDT"
//   }

import 'package:json_annotation/json_annotation.dart';

part 'coin.g.dart';

@JsonSerializable()
class Coin {
  @JsonKey(name: 's')
  final String symbol;

  @JsonKey(name: 'P')
  final String priceChangePercent;

  @JsonKey(name: 'v')
  final String volume;

  @JsonKey(name: 'c')
  final String currentPrice;

  Coin({
    required this.symbol,
    required this.priceChangePercent,
    required this.volume,
    required this.currentPrice,
  });

  /// from JSON
  factory Coin.fromJson(Map<String, dynamic> json) => _$CoinFromJson(json);

  /// to JSON
  Map<String, dynamic> toJson() => _$CoinToJson(this);
}
