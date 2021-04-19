import 'package:flutter/material.dart';

import 'model/item_data.dart';

class ItemsCollection extends ChangeNotifier {
  List<ItemData> _items = [
    ItemData(
        isChecked: true,
        image: 'assets/avatar_holder.png',
        title: 'Item Text 0'),
    ItemData(
        isChecked: false,
        image: 'assets/avatar_holder.png',
        title: 'Item Text 1'),
    ItemData(isChecked: true, image: null, title: 'Item Text 2'),
    ItemData(
        isChecked: false,
        image: 'assets/avatar_holder.png',
        title: 'Item Text 3'),
    ItemData(
        isChecked: false,
        image: 'assets/avatar_holder.png',
        title: 'Item Text 1'),
    ItemData(isChecked: true, image: null, title: 'Item Text 2'),
    ItemData(
        isChecked: false,
        image: 'assets/avatar_holder.png',
        title: 'Item Text 3')
  ];

  int length() => _items.length;

  ItemData get(int pos) {
    return _items[pos];
  }

  void addItem(String title) {
    _items.insert(0, ItemData(isChecked: false, image: null, title: title));
    notifyListeners();
  }

  void updateItem(ItemData item) {
    item.isChecked = !item.isChecked;

    notifyListeners();
  }
}
