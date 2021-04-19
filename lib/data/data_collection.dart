import 'package:flutter/material.dart';
import 'package:flutter_app_todoa/model/item_data.dart';

class DataCollection extends ChangeNotifier {
  List<ToDoItem> _items = [
    ToDoItem(
      isChecked: true,
      image: 'assets/avatar_holder.png',
      title: 'Item Text 0',
    ),
    ToDoItem(
      isChecked: false,
      image: 'assets/avatar_holder.png',
      title: 'Item Text 1',
    ),
    ToDoItem(
      isChecked: true,
      image: null,
      title: 'Item Text 2',
    ),
    ToDoItem(
      isChecked: false,
      image: 'assets/avatar_holder.png',
      title: 'Item Text 3',
    ),
    ToDoItem(
      isChecked: false,
      image: 'assets/avatar_holder.png',
      title: 'Item Text 1',
    ),
    ToDoItem(
      isChecked: true,
      image: null,
      title: 'Item Text 2',
    ),
    ToDoItem(
      isChecked: false,
      image: 'assets/avatar_holder.png',
      title: 'Item Text 3',
    )
  ];

  int length() {
    return _items.length;
  }

  ToDoItem get(int index) {
    return _items[index];
  }

  void updateToDo(ToDoItem todo) {
    todo.isChecked = !todo.isChecked;

    notifyListeners();
  }

  void addToDo(String title) {
    _items.insert(0, ToDoItem(isChecked: false, title: title));

    notifyListeners();
  }

  void deleteToDo(int position) {
    notifyListeners();
  }
}
