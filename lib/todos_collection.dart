import 'dart:collection';

import 'package:flutter/material.dart';

import 'model/todo_item.dart';

class TodosCollection extends ChangeNotifier {
  List<TodoItem> _items = [];

  int length() => _items.length;

  TodoItem get(int pos) {
    return _items[pos];
  }

  void addItem(String title) {
    _items.insert(0, TodoItem(isChecked: false, image: null, title: title));
    notifyListeners();
  }

  void updateItem(TodoItem item) {
    item.isChecked = !item.isChecked;

    notifyListeners();
  }

  List<String> getAll() {
    return UnmodifiableListView(_items.map((e) => e.title));
  }
}
