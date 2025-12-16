import 'package:json_annotation/json_annotation.dart';

part 'orderbook.g.dart';

@JsonSerializable()
class Orderbook {
  // Binance depth update returns 'a' and 'b' as arrays of [price, qty]
  @JsonKey(name: 'a')
  final List<List<String>> asks;
  @JsonKey(name: 'b')
  final List<List<String>> bids;
  @JsonKey(name: 's')
  final String symbol;

  Orderbook({required this.asks, required this.bids, required this.symbol});

  /// from JSON
  factory Orderbook.fromJson(Map<String, dynamic> json) =>
      _$OrderbookFromJson(json);

  /// to JSON
  Map<String, dynamic> toJson() => _$OrderbookToJson(this);
}
