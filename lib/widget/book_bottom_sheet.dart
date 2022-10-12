import 'package:booktrackers/classes/book.dart';
import 'package:booktrackers/screens/saved_screen.dart';
import 'package:booktrackers/services/saved_book_service.dart';
import 'package:booktrackers/widget/book_card_save_button.dart';
import 'package:booktrackers/widget/detail_widget/author_widget.dart';
import 'package:booktrackers/widget/detail_widget/description_widget.dart';
import 'package:booktrackers/widget/detail_widget/row_widget_detail_book.dart';
import 'package:booktrackers/widget/detail_widget/title_widget.dart';
import 'package:booktrackers/widget/future_book_card_save_button.dart';
import 'package:flutter/material.dart';

class BookBottomSheet extends StatelessWidget {
  final Book book;
  final SavedBook? savedBook;

  const BookBottomSheet({Key? key, required this.book, this.savedBook})
      : super(key: key);

  void saveBook() {
    SavedBook.add(book).then((_) => null);
  }

  Widget saveButtonBuilder(BuildContext context) {
    if (savedBook == null) {
      return FutureBookCardSaveButton(book: book);
    }

    if (savedBook != null) {
      return BookCardSaveButton(
        book: book,
        savedBook: savedBook,
      );
    }

    return FutureBookCardSaveButton(book: book);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        color: Color(0xFF737373).withOpacity(0),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.80,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32.0),
                  topRight: Radius.circular(32.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: (180 / 2) + 20, left: 16.0, right: 16.0),
                child: Column(
                  children: [
                    AuthorWidget(book),
                    SizedBox(height: 10.0),
                    TitleWidget(book),
                    Divider(),
                    DescriptionBookWidget(book),
                    SizedBox(height: 10.0),
                    Divider(),
                    SizedBox(height: 10.0),
                    // RowdataWidget(book),
                    SizedBox(height: 10.0),
                    savedBook == null
                        ? const SizedBox(height: 10.0)
                        : ButtonBar(
                            alignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.redAccent),
                                ),
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: ((context) {
                                        return AlertDialog(
                                          content: const Text(
                                              "Yakin menghapus buku ini dari daftar tersimpan?"),
                                          actions: [
                                            TextButton(
                                                onPressed: () =>
                                                    Navigator.pop(context),
                                                child: const Text("Batalkan")),
                                            TextButton(
                                                onPressed: () {
                                                  savedBook!
                                                      .removeFromList()
                                                      .then((_) => null);
                                                  Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: ((context) =>
                                                              const SavedScreen())));
                                                },
                                                child: const Text("Ya, hapus")),
                                          ],
                                        );
                                      }));
                                },
                                child: Text('Hapus dari daftar tersimpan'
                                    .toUpperCase()),
                              ),
                            ],
                          ),
                    Divider(),
                  ],
                ),
              ),
            ),
            Positioned(
              top: -180 / 2,
              child: Card(
                elevation: 10.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                child: Container(
                  width: 100,
                  height: 150,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      book.thumbnailSrc!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 25,
              top: 20,
              child: IconButton(
                icon: Icon(Icons.share),
                onPressed: () {},
              ),
            ),
            Positioned(
              right: 20,
              top: 20,
              child: ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                children: [
                  saveButtonBuilder(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
