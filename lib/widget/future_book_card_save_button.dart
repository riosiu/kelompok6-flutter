import 'package:booktrackers/classes/book.dart';
import 'package:booktrackers/services/saved_book_service.dart';
import 'package:booktrackers/widget/book_card_save_button.dart';
import 'package:flutter/material.dart';

class FutureBookCardSaveButton extends StatefulWidget {
  final Book book;

  const FutureBookCardSaveButton({Key? key, required this.book})
      : super(key: key);

  @override
  _FutureBookCardSaveButtonState createState() =>
      _FutureBookCardSaveButtonState();
}

class _FutureBookCardSaveButtonState extends State<FutureBookCardSaveButton> {
  Future<SavedBook>? _futureSavedBook;

  Future<SavedBook> fetchSavedBook() async {
    try {
      return await SavedBook.getOneByGoogleBooksVolumeId(widget.book.id!);
    } on Exception {
      rethrow;
    }
  }

  void _futureSavedBookSetter() {
    setState(() {
      _futureSavedBook = fetchSavedBook();
    });
  }

  @override
  void initState() {
    _futureSavedBook = fetchSavedBook();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SavedBook?>(
        future: _futureSavedBook,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return BookCardSaveButton(
              book: widget.book,
              savedBook: snapshot.data!,
              savedBookSetter: _futureSavedBookSetter,
            );
          }

          if (snapshot.hasError) {
            return BookCardSaveButton(book: widget.book);
          }

          return const CircularProgressIndicator();
        });
  }
}
