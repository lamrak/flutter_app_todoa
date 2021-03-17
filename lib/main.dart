import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

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

class TileItem extends StatelessWidget {
  final bool isChecked;
  final String image;
  final String title;

  TileItem({
    this.isChecked = false,
    this.title,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    bool isImageExists = !(image == null || image.isEmpty);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 12.0),
      child: Row(
        children: [
          Checkbox(
            value: isChecked,
            onChanged: (bool value) {},
          ),
          Container(
            margin: EdgeInsets.all(12.0),
            width: isImageExists ? 60.0 : 10.0,
            height: 60.0,
            decoration: isImageExists
                ? BoxDecoration(
                    color: const Color(0xff7c94b6),
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    border: Border.all(
                      color: Colors.white,
                      width: 4.0,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 4.0), //(x,y)
                        blurRadius: 6.0,
                      ),
                    ],
                  )
                : null,
          ),
          Expanded(
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 24),
            ),
          )
        ],
      ),
    );
  }
}
