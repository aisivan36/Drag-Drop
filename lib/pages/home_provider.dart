import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/customer.dart';
import '../models/item.dart';

final globalKey = StateProvider<GlobalKey>(((ref) => GlobalKey()));

final listOfItems = StateNotifierProvider<ListOfItems, List<Item>>((ref) {
  return ListOfItems();
});
final listOfPeople = StateNotifierProvider<ListOfPeople, List<Customer>>((ref) {
  return ListOfPeople();
});

class ListOfItems extends StateNotifier<List<Item>> {
  ListOfItems() : super([]);

  List<Item> items = [
    const Item(
      name: 'Spinach Pizza',
      totalPriceCents: 1299,
      uid: '1',
      imageProvider: NetworkImage('https://flutter'
          '.dev/docs/cookbook/img-files/effects/split-check/Food1.jpg'),
    ),
    const Item(
      name: 'Veggie Delight',
      totalPriceCents: 799,
      uid: '2',
      imageProvider: NetworkImage('https://flutter'
          '.dev/docs/cookbook/img-files/effects/split-check/Food2.jpg'),
    ),
    const Item(
      name: 'Chicken Parmesan',
      totalPriceCents: 1499,
      uid: '3',
      imageProvider: NetworkImage('https://flutter'
          '.dev/docs/cookbook/img-files/effects/split-check/Food3.jpg'),
    ),
  ];
}

class ListOfPeople extends StateNotifier<List<Customer>> {
  ListOfPeople() : super([]);

  List<Customer> people = [
    Customer(
      name: 'Makayla',
      imageProvider: const NetworkImage('https://flutter'
          '.dev/docs/cookbook/img-files/effects/split-check/Avatar1.jpg'),
    ),
    Customer(
      name: 'Nathan',
      imageProvider: const NetworkImage('https://flutter'
          '.dev/docs/cookbook/img-files/effects/split-check/Avatar2.jpg'),
    ),
    Customer(
      name: 'Emilio',
      imageProvider: const NetworkImage('https://flutter'
          '.dev/docs/cookbook/img-files/effects/split-check/Avatar3.jpg'),
    ),
  ];
}
