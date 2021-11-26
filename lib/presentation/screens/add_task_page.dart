import 'package:flutter/material.dart';
import 'package:flutter_app_todoa/domain/repository/todo_repository.dart';
import 'package:flutter_app_todoa/presentation/widget/rounded_button.dart';
import 'package:provider/provider.dart';

class AddTaskPage extends StatefulWidget {
  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
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
              Provider.of<TodoRepository>(context, listen: false)
                  .addTodo(newTitle);

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
