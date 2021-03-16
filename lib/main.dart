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
      body: Column(
        children: [
          Stack(
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
          ),
          Column(
            children: [
              Row(
                children: [
                  Checkbox(
                    value: true,
                    onChanged: (bool value) {},
                  ),
                  Container(
                    margin: EdgeInsets.all(12.0),
                    width: 80.0,
                    height: 80.0,
                    decoration: new BoxDecoration(
                      color: const Color(0xff7c94b6),
                      image: DecorationImage(
                        image: AssetImage('assets/bg_header.png'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius:
                          new BorderRadius.all(new Radius.circular(50.0)),
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
                    ),
                  ),
                  Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 12.0, vertical: 0.0),
                      child: Text(
                        'Item Text',
                        style: TextStyle(fontSize: 24),
                      ))
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: true,
                    onChanged: (bool value) {},
                  ),
                  Container(
                    margin: EdgeInsets.all(12.0),
                    width: 80.0,
                    height: 80.0,
                    decoration: new BoxDecoration(
                      color: const Color(0xff7c94b6),
                      image: DecorationImage(
                        image: AssetImage('assets/bg_header.png'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius:
                          new BorderRadius.all(new Radius.circular(50.0)),
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
                    ),
                  ),
                  Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 12.0, vertical: 0.0),
                      child: Text(
                        'Item Text',
                        style: TextStyle(fontSize: 24),
                      ))
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: true,
                    onChanged: (bool value) {},
                  ),
                  Container(
                    margin: EdgeInsets.all(12.0),
                    width: 80.0,
                    height: 80.0,
                    decoration: new BoxDecoration(
                      color: const Color(0xff7c94b6),
                      image: DecorationImage(
                        image: AssetImage('assets/bg_header.png'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius:
                          new BorderRadius.all(new Radius.circular(50.0)),
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
                    ),
                  ),
                  Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 12.0, vertical: 0.0),
                      child: Text(
                        'Item Text',
                        style: TextStyle(fontSize: 24),
                      ))
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: true,
                    onChanged: (bool value) {},
                  ),
                  Container(
                    margin: EdgeInsets.all(12.0),
                    width: 80.0,
                    height: 80.0,
                    decoration: new BoxDecoration(
                      color: const Color(0xff7c94b6),
                      image: DecorationImage(
                        image: AssetImage('assets/bg_header.png'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius:
                          new BorderRadius.all(new Radius.circular(50.0)),
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
                    ),
                  ),
                  Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 12.0, vertical: 0.0),
                      child: Text(
                        'Item Text',
                        style: TextStyle(fontSize: 24),
                      ))
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
