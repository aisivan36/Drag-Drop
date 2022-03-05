import 'package:drag_drop/models/customer.dart';
import 'package:drag_drop/models/item.dart';
import 'package:drag_drop/pages/home_provider.dart';
import 'package:drag_drop/widgets/appbar.dart';
import 'package:drag_drop/widgets/customer_cart.dart';
import 'package:drag_drop/widgets/dragging_list_item.dart';
import 'package:drag_drop/widgets/menu_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends ConsumerState<HomePage> {
  void _itemDroppedOnCustomerCart(
      {required Item item, required Customer customer}) {
    setState(() {
      customer.items.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff7f7f7),
      appBar: const CustomAppBar(),
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: buildMenuList(),
                ),
                buildPeopleRow(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMenuList() {
    final _items = ref.read(listOfItems.notifier).items;

    return ListView.separated(
      padding: const EdgeInsets.all(13.0),
      itemCount: _items.length,
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 12.0,
        );
      },
      itemBuilder: (context, index) {
        final item = _items[index];
        return buildMenuItem(item: item);
      },
    );
  }

  Widget buildMenuItem({required Item item}) {
    return LongPressDraggable<Item>(
      data: item,
      dragAnchorStrategy: pointerDragAnchorStrategy,
      feedback: DraggingListItem(
        dragKey: ref.read(globalKey),
        photoProvider: item.imageProvider,
      ),
      child: MenuListItem(
        name: item.name,
        price: item.formattedTotalItemPrice,
        photoProvider: item.imageProvider,
      ),
    );
  }

  Widget buildPeopleRow() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 20.0,
      ),
      child: Row(
          children: ref
              .read(listOfPeople.notifier)
              .people
              .map((e) => buildPersonWithDropZone(customer: e))
              .toList()),
    );
  }

  Widget buildPersonWithDropZone({required Customer customer}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0),
        child: DragTarget<Item>(
          builder: (context, candidateData, rejectedData) => CustomerCart(
            customer: customer,
            hasItems: customer.items.isNotEmpty,
            highlighted: candidateData.isNotEmpty,
          ),
          onAccept: (item) {
            _itemDroppedOnCustomerCart(item: item, customer: customer);
          },
        ),
      ),
    );
  }
}
