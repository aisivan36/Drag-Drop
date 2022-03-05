import 'package:flutter/material.dart';

@immutable
class Item {
  final int totalPriceCents;
  final String name;
  final String uid;
  final ImageProvider imageProvider;
  const Item({
    required this.totalPriceCents,
    required this.name,
    required this.uid,
    required this.imageProvider,
  });

  String get formattedTotalItemPrice =>
      '\$${(totalPriceCents / 100.0).toStringAsFixed(2)}';
}
