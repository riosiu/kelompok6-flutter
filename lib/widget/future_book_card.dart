import 'package:booktrackers/classes/book.dart';
import 'package:booktrackers/services/saved_book_service.dart';
import 'package:booktrackers/widget/book_card.dart';
import 'package:flutter/cupertino.dart';

class FutureBookCard extends StatefulWidget {
  final SavedBook savedBook;
  final Function? savedBookSetter;

  const FutureBookCard(
      {Key? key, required this.savedBook, this.savedBookSetter})
      : super(key: key);

  @override
  _FutureBookCardState createState() => _FutureBookCardState();
}

class _FutureBookCardState extends State<FutureBookCard> {
  Future<Book>? _futureBook;

  Future<Book> fetchBook() {
    return widget.savedBook.toBook();
  }

  Widget bookCardBuilder() {
    return FutureBuilder<Book>(
        future: _futureBook,
        builder: ((context, snapshot) {
          if (snapshot.data != null) {
            return BookCard(
              book: snapshot.data!,
              savedBook: widget.savedBook,
            );
          } else {
            return const SizedBox(height: 120);
          }
        }));
  }

  @override
  void initState() {
    _futureBook = fetchBook();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return bookCardBuilder();
  }
}
