import 'package:flutter/material.dart';
import 'package:flutter_app_todoa/components/rounded_button.dart';
import 'package:flutter_app_todoa/data/data_collection.dart';
import 'package:provider/provider.dart';

class AddTaskPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String newToDoTitle = '';

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
              newToDoTitle = newText;
            },
          ),
          SizedBox(
            height: 20.0,
          ),
          RoundedButton(
            title: 'Add',
            onTap: () {
              if (newToDoTitle.isNotEmpty) {
                Provider.of<DataCollection>(context, listen: false)
                    .addToDo(newToDoTitle);
              }
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
