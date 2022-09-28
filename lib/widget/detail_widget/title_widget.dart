import 'package:flutter/material.dart';
import 'package:booktrackers/classes/book.dart';

class TitleWidget extends StatelessWidget {
  final Book book;

  TitleWidget(this.book);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          FittedBox(
            child: Text(
              book.title ?? "Tanpa judul",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
            ),
          ),
          Text(
              textAlign: TextAlign.center,
              book.publishedDateString != null
                  ? "${book.publishedDateString!.substring(0, 4)}"
                  : "",
              style: TextStyle(fontSize: 18.0)),
        ],
      ),
    );
  }
}
