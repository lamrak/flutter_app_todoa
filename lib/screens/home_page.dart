import 'package:flutter/material.dart';
import 'package:flutter_app_todoa/components/bottom_button.dart';
import 'package:flutter_app_todoa/model/item_data.dart';
import 'package:flutter_app_todoa/widgets/tile_item.dart';

import 'add_task_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            _buildTopBar(context),
            _buildBodyContent(),
            _buildBottomBar(context)
          ],
        ),
      ),
    );
  }

  Stack _buildTopBar(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity, // MediaQuery.of(context).size.width
          height: 140,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/bg_header.png'),
            ),
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Container(
            height: 20.0,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0)),
            ),
          ),
        ),
        Positioned(
          left: 20,
          top: 37,
          child: Text(
            'TODOa',
            style: TextStyle(
                color: Colors.white, fontSize: 46, fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }

  Widget _buildBodyContent() {
    List<ItemData> items = [
      ItemData(
        isChecked: true,
        image: 'assets/avatar_holder.png',
        title: 'Item Text 0',
      ),
      ItemData(
        isChecked: false,
        image: 'assets/avatar_holder.png',
        title: 'Item Text 1',
      ),
      ItemData(
        isChecked: true,
        image: null,
        title: 'Item Text 2',
      ),
      ItemData(
        isChecked: false,
        image: 'assets/avatar_holder.png',
        title: 'Item Text 3',
      ),
      ItemData(
        isChecked: false,
        image: 'assets/avatar_holder.png',
        title: 'Item Text 1',
      ),
      ItemData(
        isChecked: true,
        image: null,
        title: 'Item Text 2',
      ),
      ItemData(
        isChecked: false,
        image: 'assets/avatar_holder.png',
        title: 'Item Text 3',
      )
    ];

    return Expanded(
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: TileItem(
              isChecked: items[index].isChecked,
              title: items[index].title,
              image: items[index].image,
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
