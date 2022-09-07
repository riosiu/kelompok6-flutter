import 'package:belajar_flutter/fons_style.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: AppBarTheme(foregroundColor: Colors.black)),
      home: Scaffold(
        appBar: AppBar(
          title: (Text('Green House')),
          backgroundColor: Colors.cyanAccent[200],
        ),
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            padding: EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 30),
            child: Column(
              children: <Widget>[
                Image(
                  image: AssetImage('assets/images/garden-house.jpg'),
                  height: 500,
                ),
                Text(
                  'Garden House',
                  style: mainHeader,
                ),
                Text(
                  'Garden House  merupakan konsep Rumah yang bernuansa Alam',
                  style: paragrafStyle,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
