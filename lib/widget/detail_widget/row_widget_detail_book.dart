import 'package:flutter/material.dart';
import 'package:booktrackers/classes/book.dart';

class RowdataWidget extends StatefulWidget {
  final Book book;

  RowdataWidget(this.book);

  @override
  State<RowdataWidget> createState() => _RowdataWidgetState();
}

class _RowdataWidgetState extends State<RowdataWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Publisher',
                style: TextStyle(color: Colors.teal),
              ),
              Text(
                widget.book.publisher ?? '',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
                softWrap: true,
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Pages',
                style: TextStyle(color: Colors.teal),
              ),
              Text(
                widget.book.pageCount == null
                    ? '---'
                    : widget.book.pageCount.toString(),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Rating',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.teal),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Published',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.teal),
              ),
              Text(
                widget.book.publishedDateString ?? '',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
