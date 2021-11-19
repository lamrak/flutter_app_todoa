import 'package:flutter/material.dart';
import 'package:flutter_app_todoa/model/item_data.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key key, this.itemData}) : super(key: key);

  final ItemData itemData;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onTap: () {
            Navigator.pop(context, itemData.title);
          },
          child: Container(
            child: Center(
              child: Text(itemData.title),
            ),
          ),
        ),
      ),
    );
  }
}
