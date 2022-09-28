import 'package:flutter/material.dart';
import 'package:booktrackers/classes/book.dart';

class AuthorWidget extends StatelessWidget {
  final Book book;
  AuthorWidget(this.book);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        book.authors != null ? "${book.authors}" : "",
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.teal, fontSize: 16.0),
        softWrap: true,
      ),
    );
  }
}
