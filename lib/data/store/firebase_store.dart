import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseStore {
  var _firestore = FirebaseFirestore.instance;

  Stream getTodosStream() => _firestore.collection("todos").snapshots();

  void addTodo(String title) {
    _firestore.collection('todos').add({
      'title': title,
      'image':
          'https://firebasestorage.googleapis.com/v0/b/todoa-5403a.appspot.com/o/todo.png?alt=media&token=e585808f-3405-4004-9f4a-3fc5ee42fa19',
      'isChecked': false,
    });
  }

  void updateTodo(String id, bool isChecked) {
    _firestore.collection('todos').doc(id).update({"isChecked": isChecked});
  }
}
