import 'package:flutter/material.dart';
import 'package:flutter_app_todoa/model/item_data.dart';
import 'package:flutter_app_todoa/screens/add_task_page.dart';
import 'package:flutter_app_todoa/screens/detail_screen.dart';
import 'package:flutter_app_todoa/widget/bottom_button.dart';
import 'package:flutter_app_todoa/widget/todo_row.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('ToDoa'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildBodyContent(),
            _buildBottomBar(context),
          ],
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }

  Widget _buildBodyContent() {
    List<ItemData> items = [
      ItemData(
        isChecked: true,
        image: 'assets/avatar_holder.png',
        title: 'Math',
      ),
      ItemData(
        isChecked: false,
        image: 'assets/avatar_holder.png',
        title: 'Architecture',
      ),
      ItemData(
        isChecked: true,
        image: null,
        title: 'Biology',
      ),
      ItemData(
        isChecked: false,
        image: 'assets/avatar_holder.png',
        title: 'Flutter',
      ),
      ItemData(
        isChecked: false,
        image: 'assets/avatar_holder.png',
        title: 'Artificial Intelligences',
      ),
    ];

    return Container(
      width: double.infinity,
      height: 560,
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
                title: items[index].title,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return BottomButton(
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
        });
  }
}
