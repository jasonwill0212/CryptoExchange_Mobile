import 'package:json_annotation/json_annotation.dart';

part 'orderbook.g.dart';

/// DTO -> Data Transfer Object
@JsonSerializable()
class Orderbook {
  // Binance depth update returns 'a' and 'b' as arrays of [price, qty]
  @JsonKey(name: 'a')
  final List<List<String>> asks;

  @JsonKey(name: 'b')
  final List<List<String>> bids;

  /// ["12345.67", "0.001"]
  /// Map to OrderbookEntry
  /// [price, quantity]

  @JsonKey(name: 's')
  final String symbol;

  Orderbook({required this.asks, required this.bids, required this.symbol});

  /// from JSON
  factory Orderbook.fromJson(Map<String, dynamic> json) =>
      _$OrderbookFromJson(json);

  /// to JSON
  Map<String, dynamic> toJson() => _$OrderbookToJson(this);

  /// Get list of OrderbookEntry for asks
  List<OrderbookEntry> get askEntries => asks
      .map(
        (item) => OrderbookEntry(
          price: double.parse(item[0]),
          quantity: double.parse(item[1]),
        ),
      )
      .toList();

  /// Get list of OrderbookEntry for bids
  List<OrderbookEntry> get bidEntries => bids
      .map(
        (entry) => OrderbookEntry(
          price: double.parse(entry[0]),
          quantity: double.parse(entry[1]),
        ),
      )
      .toList();
}

class OrderbookEntry {
  final double price;
  final double quantity;

  OrderbookEntry({required this.price, required this.quantity});
}
