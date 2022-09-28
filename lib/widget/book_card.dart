import 'package:booktrackers/classes/book.dart';
import 'package:booktrackers/screens/saved_screen.dart';
import 'package:booktrackers/services/saved_book_service.dart';
import 'package:booktrackers/widget/book_bottom_sheet.dart';
import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final Book book;
  final SavedBook? savedBook;

  // TODO: delete
  final String? title;
  final int? year;
  final String? coverImageSrc;
  final String? description;

  const BookCard(
      {super.key,
      required this.book,
      this.savedBook,
      this.title,
      this.year,
      this.coverImageSrc,
      this.description});

  void saveBook() {
    SavedBook.add(book).then((_) => null);
  }

  Widget saveButtonBuilder(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        foregroundColor:
            MaterialStateProperty.all<Color>(Theme.of(context).primaryColor),
      ),
      onPressed: () {
        saveBook();
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const SavedScreen()));
      },
      child: savedBook?.page != null && book.pageCount != null
          ? Text("${savedBook!.page / book.pageCount!}%")
          : const Icon(Icons.add),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    title: Text(book.title ?? "Tanpa judul"),
                    subtitle: Text(
                      book.publishedDateString != null
                          ? "Tahun ${book.publishedDateString!.substring(0, 4)}"
                          : "",
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      book.description ?? "",
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                  ),
                  // Visibility(
                  //     visible: book.smallThumbnailSrc != null,
                  //     child: Image.network(book.smallThumbnailSrc!)),
                  book.smallThumbnailSrc != null
                      ? Image.network(book.smallThumbnailSrc!)
                      : const SizedBox(),
                  ButtonBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(
                              Theme.of(context).primaryColor),
                        ),
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (BuildContext context) {
                                return BookBottomSheet(book: book);
                              });
                        },
                        child: Text('Lihat Detil'.toUpperCase()),
                      ),
                      saveButtonBuilder(context),
                    ],
                  ),
                ],
              ),
            )));
  }
}
