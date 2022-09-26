import 'package:booktrackers/widget/book_bottom_sheet.dart';
import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final String? title;
  final int? year;
  final String? coverImageSrc;
  final String? description;

  const BookCard(
      {super.key, this.title, this.year, this.coverImageSrc, this.description});

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
                    title: Text(title ?? ""),
                    subtitle: Text(
                      year.toString(),
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      description ?? "",
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                  ),
                  Visibility(
                      visible: coverImageSrc != null,
                      child: Image.network(coverImageSrc ?? "")),
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
                                return const BookBottomSheet();
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
