import 'package:booktrackers/classes/book.dart';
import 'package:booktrackers/widget/book_bottom_sheet.dart';
import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final Book book;

  // TODO: delete
  final String? title;
  final int? year;
  final String? coverImageSrc;
  final String? description;

  const BookCard(
      {super.key,
      required this.book,
      this.title,
      this.year,
      this.coverImageSrc,
      this.description});

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
                  Container(
                      width: 100,
                      height: 150,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: book.thumbnailSrc != null
                            ? Image.network(book.thumbnailSrc!)
                            : const SizedBox(),
                      )),
                  // nambahain gambar
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
                      TextButton(
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(
                              Theme.of(context).primaryColor),
                        ),
                        onPressed: () {
                          // Perform some action
                        },
                        child: const Icon(Icons.add),
                      ),
                    ],
                  ),
                ],
              ),
            )));
  }
}
