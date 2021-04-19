import 'package:flutter/material.dart';
import 'package:flutter_app_todoa/items_collection.dart';
import 'package:flutter_app_todoa/screens/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => ItemsCollection(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          backgroundColor: Colors.grey,
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}
