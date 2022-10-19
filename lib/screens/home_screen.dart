import 'package:flutter/material.dart';
import 'package:booktrackers/widget/my_bottom_navigation_bar.dart';
import 'package:booktrackers/helpers/theme.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: ListView(
          children: <Widget>[
            Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/images/hero-bg.png"),
                  fit: BoxFit.fill,
                )),
                // margin: const EdgeInsets.all(16),
                child: Column(children: <Widget>[
                  Center(
                    child: Container(
                        margin: const EdgeInsets.only(top: 128, bottom: 16),
                        child: const Image(
                          image: AssetImage('assets/images/logotext.png'),
                          height: 80,
                        )),
                  ),
                  Container(
                      margin: const EdgeInsets.only(bottom: 48),
                      child: Chip(
                        label: Column(children: [
                          Text("Level 12"),
                          Text(
                            "420xp",
                            style: TextStyle(fontSize: 8),
                          )
                        ]),
                        avatar: CircularProgressIndicator(
                          strokeWidth: 3.0,
                          value: 0.41,
                          color: Theme.of(context).primaryColor,
                          backgroundColor: Colors.black12,
                        ),
                      ))
                ])),
            Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: const Text("Lanjut membaca",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Colors.black54))),
            
          ],
        ),
        bottomNavigationBar: MyBottomNavigationBar(
          currentIndex: 0,
          theme: theme,
        ));
  }
}
