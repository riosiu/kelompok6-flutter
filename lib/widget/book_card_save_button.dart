import 'package:booktrackers/classes/book.dart';
import 'package:booktrackers/screens/saved_screen.dart';
import 'package:booktrackers/services/saved_book_service.dart';
import 'package:booktrackers/widget/update_page_dialog.dart';
import 'package:flutter/material.dart';

class BookCardSaveButton extends StatelessWidget {
  final Book book;
  final SavedBook? savedBook;
  final Function? savedBookSetter;

  const BookCardSaveButton(
      {Key? key, required this.book, this.savedBook, this.savedBookSetter})
      : super(key: key);

  void saveBook() {
    SavedBook.add(book).then((_) => null);
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        foregroundColor:
            MaterialStateProperty.all<Color>(Theme.of(context).primaryColor),
      ),
      onPressed: () {
        if (savedBook?.page == null) {
          saveBook();
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const SavedScreen()));
        } else {
          showDialog(
              context: context,
              builder: ((context) => UpdatePageDialog(
                    savedBook: savedBook!,
                    savedBookSetter: savedBookSetter,
                    book: book,
                  )));
        }
      },
      child: savedBook?.page != null && book.pageCount != null
          ? Text("${savedBook!.page * 100 ~/ book.pageCount!}%")
          : const Icon(Icons.bookmark_add_outlined),
    );
  }
}
