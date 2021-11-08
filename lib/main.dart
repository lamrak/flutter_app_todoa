import 'package:flutter/material.dart';
import 'package:flutter_app_todoa/to_do_row.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDoa',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  var todoItems = [
    'Math',
    'Architecture',
    'Biology',
    'Flutter',
    'Artificial Intelligences',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDoa'),
      ),
      body: Center(
          child: ListView.builder(
        // Let the ListView know how many items it needs to build.
        itemCount: todoItems.length,
        itemBuilder: (context, index) {
          var item = todoItems[index];

          return ToDoRow(title: item);
        },
      )), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
