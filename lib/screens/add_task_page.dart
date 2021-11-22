import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_todoa/widget/rounded_button.dart';

class AddTaskPage extends StatefulWidget {
  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final firestore = FirebaseFirestore.instance;
  var newTitle = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20.0, right: 20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
          Text(
            'Add Task',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30.0,
              color: Colors.lightBlueAccent,
            ),
          ),
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
            onChanged: (newText) {
              setState(() {
                this.newTitle = newText;
              });
            },
          ),
          SizedBox(
            height: 20.0,
          ),
          RoundedButton(
            title: 'Add',
            onTap: () {
              firestore.collection('todos').add({
                'title': newTitle,
                'image':
                    'https://firebasestorage.googleapis.com/v0/b/todoa-5403a.appspot.com/o/todo.png?alt=media&token=e585808f-3405-4004-9f4a-3fc5ee42fa19',
                'isChecked': false,
              });

              Navigator.pop(context);
            },
          ),
          SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }
}
