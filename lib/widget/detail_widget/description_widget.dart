import 'package:flutter/material.dart';
import 'package:booktrackers/classes/book.dart';

class DescriptionBookWidget extends StatefulWidget {
  final Book book;

  DescriptionBookWidget(this.book);

  @override
  State<DescriptionBookWidget> createState() => _DescriptionBookWidgetState();
}

class _DescriptionBookWidgetState extends State<DescriptionBookWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.grey[50],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'DESCRIPTION',
              style: TextStyle(
                  color: Colors.teal,
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5.0,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                child: SingleChildScrollView(
                    child: Text(
                  widget.book.description ?? "",
                  style: TextStyle(
                    fontSize: 14.0,
                    letterSpacing: 0.2,
                  ),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
