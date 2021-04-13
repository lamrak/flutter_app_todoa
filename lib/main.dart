import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
        backgroundColor: Colors.grey,
        primarySwatch: Colors.blue,
      ),
      home: ChuckNorris(),
    );
  }
}

class ChuckNorris extends StatefulWidget {
  @override
  _ChuckNorrisState createState() => _ChuckNorrisState();
}

class _ChuckNorrisState extends State<ChuckNorris> {
  String randomJoke = 'mocked data';
  String randomImage = 'https://picsum.photos/250?image=9';

  @override
  void initState() {
    makeCallAmdUpdateUI();

    super.initState();
  }

  void makeCallAmdUpdateUI() async {
    ChuckJoke joke = await makeHttpRequest();

    setState(() {
      randomJoke = joke.joke;
      randomImage = joke.image;
    });
  }

  Future<ChuckJoke> makeHttpRequest() async {
    var url = Uri.https(
        'matchilling-chuck-norris-jokes-v1.p.rapidapi.com', '/jokes/random');

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url, headers: {
      "accept": "application/json",
      "x-rapidapi-key": "4d9efca2damshb443fb43e51a269p1a3f08jsnd3aad9e1e4e9",
      "x-rapidapi-host": "matchilling-chuck-norris-jokes-v1.p.rapidapi.com",
    });

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      var itemCount = jsonResponse['totalItems'];
      print('Number of books about http: $itemCount.');

      return ChuckJoke(
          image: jsonResponse['icon_url'], joke: jsonResponse['value']);
    } else {
      print('Request failed with status: ${response.statusCode}.');

      return ChuckJoke(image: '', joke: '');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.network(randomImage),
                  Text(
                    randomJoke,
                    style: TextStyle(
                        backgroundColor: Colors.white,
                        fontSize: 24,
                        color: Colors.black),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}

class ChuckJoke {
  final String image;
  final String joke;

  ChuckJoke({required this.image, required this.joke}) {}
}
