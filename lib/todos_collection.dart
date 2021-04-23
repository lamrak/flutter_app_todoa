import 'package:flutter/material.dart';

import 'model/todo_item.dart';

class TodosCollection extends ChangeNotifier {
  List<TodoItem> _items = [
    TodoItem(
        isChecked: true,
        image: 'assets/avatar_holder.png',
        title: 'Item Text 0'),
    TodoItem(
        isChecked: false,
        image: 'assets/avatar_holder.png',
        title: 'Item Text 1'),
    TodoItem(isChecked: true, image: null, title: 'Item Text 2'),
    TodoItem(
        isChecked: false,
        image: 'assets/avatar_holder.png',
        title: 'Item Text 3'),
    TodoItem(
        isChecked: false,
        image: 'assets/avatar_holder.png',
        title: 'Item Text 1'),
    TodoItem(isChecked: true, image: null, title: 'Item Text 2'),
    TodoItem(
        isChecked: false,
        image: 'assets/avatar_holder.png',
        title: 'Item Text 3')
  ];

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
}
