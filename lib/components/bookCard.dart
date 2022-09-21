import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final String title;
  final int year;
  final String coverImageSrc;
  final String description;

  const BookCard(
      {super.key,
      required this.title,
      required this.year,
      required this.coverImageSrc,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              ListTile(
                title: Text(title),
                subtitle: Text(
                  year.toString(),
                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  description,
                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                ),
              ),
              Image.network(coverImageSrc),
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(
                          Theme.of(context).primaryColor),
                    ),
                    onPressed: () {
                      // Perform some action
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
        ));
  }
}
