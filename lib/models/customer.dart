import 'package:flutter/material.dart';

import 'package:drag_drop/models/item.dart';

class Customer {
  final String name;
  final ImageProvider imageProvider;
  final List<Item> items;

  Customer({
    required this.name,
    required this.imageProvider,
    List<Item>? items,
  }) : items = items ?? [];

  String get formattedTotalItemPrice {
    final totalPriceCents = items.fold<int>(
        0, (previousValue, item) => previousValue + item.totalPriceCents);
    return '\$${(totalPriceCents / 100.0).toStringAsFixed(2)}';
  }
}
