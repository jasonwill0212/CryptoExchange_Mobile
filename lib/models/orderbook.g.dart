// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orderbook.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Orderbook _$OrderbookFromJson(Map<String, dynamic> json) => Orderbook(
  asks: (json['a'] as List<dynamic>)
      .map((e) => (e as List<dynamic>).map((e) => e as String).toList())
      .toList(),
  bids: (json['b'] as List<dynamic>)
      .map((e) => (e as List<dynamic>).map((e) => e as String).toList())
      .toList(),
  symbol: json['s'] as String,
);

Map<String, dynamic> _$OrderbookToJson(Orderbook instance) => <String, dynamic>{
  'a': instance.asks,
  'b': instance.bids,
  's': instance.symbol,
};
