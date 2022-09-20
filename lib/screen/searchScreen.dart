import 'package:flutter/material.dart';

class SearchBooks extends StatefulWidget {
  const SearchBooks({super.key});

  @override
  State<SearchBooks> createState() => _SearchBooksState();
}

class _SearchBooksState extends State<SearchBooks> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage("assets/images/hero-bg.png"),
        fit: BoxFit.fill,
      )),
      // margin: const EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          Center(
            child: Container(
                margin: const EdgeInsets.only(top: 128, bottom: 64),
                child: const Image(
                  image: AssetImage('assets/images/logotext.png'),
                  height: 80,
                )),
          )
        ],
      ),
    );
  }
}
