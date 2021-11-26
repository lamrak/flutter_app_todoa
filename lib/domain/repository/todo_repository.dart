import 'package:flutter/foundation.dart';
import 'package:flutter_app_todoa/data/store/firebase_store.dart';

class TodoRepository extends ChangeNotifier {
  final FirebaseStore firebaseStore;

  TodoRepository({this.firebaseStore});

  getTodosStream() => firebaseStore.getTodosStream();

  void addTodo(String title) {
    firebaseStore.addTodo(title);
  }

  void updateTodo(String id, bool isChecked) {
    firebaseStore.updateTodo(id, isChecked);
  }
}
