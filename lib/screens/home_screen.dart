import 'package:flutter/material.dart';
import 'package:flutter_app_todoa/screens/tile_item.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          _buildTopBar(context),
          _buildBodyContent(),
        ],
      ),
    );
  }

  Column _buildBodyContent() {
    return Column(
      children: [
        TileItem(
          isChecked: true,
          title: 'Item Text',
          image: 'assets/avatar_holder.png',
        ),
        TileItem(
          isChecked: false,
          title: 'Item Text 2 with long text',
          image: 'assets/avatar_holder.png',
        ),
        TileItem(
          isChecked: false,
          title: 'Item Text 3 no image',
          image: null,
        ),
      ],
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
      ],
    );
  }
}
