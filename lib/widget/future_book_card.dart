import 'package:booktrackers/classes/book.dart';
import 'package:booktrackers/services/saved_book_service.dart';
import 'package:booktrackers/widget/book_card.dart';
import 'package:flutter/cupertino.dart';

class FutureBookCard extends StatefulWidget {
  final SavedBook savedBook;

  const FutureBookCard({Key? key, required this.savedBook}) : super(key: key);

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
          if (!snapshot.hasData && snapshot.data != null) {
            return const SizedBox(height: 120);
          }

          return BookCard(book: snapshot.data!);
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
