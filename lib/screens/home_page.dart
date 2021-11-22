import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_todoa/model/item_data.dart';
import 'package:flutter_app_todoa/screens/add_task_page.dart';
import 'package:flutter_app_todoa/screens/detail_screen.dart';
import 'package:flutter_app_todoa/widget/bottom_button.dart';
import 'package:flutter_app_todoa/widget/todo_row.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('ToDoa'),
        ),
        body: StreamBuilder(
          stream: _firestore.collection("todos").snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            List<ItemData> items = [];
            if (snapshot.hasData) {
              snapshot.data.docs.forEach((QueryDocumentSnapshot query) {
                Map<String, dynamic> data = query.data();

                items.add(ItemData(
                  title: data['title'],
                  image: data['image'],
                  isChecked: data['isChecked'],
                ));
              });
            }

            if (items.isEmpty) {
              return Center(
                child: Text('No todos'),
              );
            } else {
              return Stack(
                children: [
                  _buildBodyContent(items),
                  _buildBottomBar(context),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildBodyContent(List<ItemData> items) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      bottom: 0,
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () async {
              var result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(
                      itemData: items[index],
                    ),
                  ));

              debugPrint('$result');
            },
            child: ListTile(
              title: ToDoRow(
                item: items[index],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: BottomButton(
          title: 'Add Item',
          onTap: () {
            showModalBottomSheet<void>(
              context: context,
              isScrollControlled: true,
              builder: (BuildContext context) {
                return Container(
                  height: 220,
                  color: Color(0xff757575),
                  child: AddTaskPage(),
                );
              },
            );
          }),
    );
  }
}
