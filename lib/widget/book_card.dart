import 'package:booktrackers/classes/book.dart';
import 'package:booktrackers/screens/saved_screen.dart';
import 'package:booktrackers/services/saved_book_service.dart';
import 'package:booktrackers/widget/book_bottom_sheet.dart';
import 'package:booktrackers/widget/book_card_save_button.dart';
import 'package:booktrackers/widget/future_book_card_save_button.dart';
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
    // return Column(children: [
    //   SizedBox(height: 30),
    //   Container(
    //     padding: const EdgeInsets.symmetric(horizontal: 8),
    //     child: Container(
    //       height: 250,
    //       child: Stack(
    //         children: [
    //           Positioned(
    //             top: 0,
    //             left: 20,
    //             child: Card(
    //               elevation: 10,
    //               shadowColor: Colors.teal.withOpacity(0.5),
    //               shape: RoundedRectangleBorder(
    //                 borderRadius: BorderRadius.circular(15),
    //               ),
    //               child: Container(
    //                 height: 200,
    //                 width: 150,
    //                 child: GestureDetector(
    //                     onTap: () {
    //                       showModalBottomSheet(
    //                           context: context,
    //                           isScrollControlled: true,
    //                           builder: (BuildContext context) {
    //                             return BookBottomSheet(book: book);
    //                           });
    //                     },
    //                     child: Container(
    //                       decoration: BoxDecoration(
    //                         borderRadius: BorderRadius.circular(10.0),
    //                         image: DecorationImage(
    //                             image: NetworkImage(book.thumbnailSrc!),
    //                             fit: BoxFit.cover),
    //                       ),
    //                     )),
    //               ),
    //             ),
    //           ),
    //           Positioned(
    //             top: 8,
    //             right: -20,
    //             width: 300,
    //             child: Container(
    //               height: 150,
    //               width: 180,
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   ListTile(
    //                     title: Text(
    //                       book.title ?? "Tanpa judul",
    //                       style: TextStyle(color: Colors.teal, fontSize: 18),
    //                     ),
    //                     subtitle: Text(
    //                       book.publishedDateString != null
    //                           ? "Tahun ${book.publishedDateString!.substring(0, 4)}"
    //                           : "",
    //                       style: TextStyle(color: Colors.teal, fontSize: 16),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           )
    //         ],
    //       ),
    //     ),
    //   ),
    // ]);

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
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(book.thumbnailSrc!),
              ),
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
        ),
      ),
    );
  }
}
