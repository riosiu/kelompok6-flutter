import 'package:booktrackers/classes/book.dart';
import 'package:flutter/material.dart';

class BookBottomSheet extends StatelessWidget {
  final Book book;

  const BookBottomSheet({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: 0.6,
        expand: false,
        builder: (context, scrollController) => ListView(
              controller: scrollController,
              children: [
                ListTile(
                    title: Text(book.title ?? "Tanpa judul"),
                    subtitle: Text(
                      book.publishedDateString != null
                          ? "Tahun ${book.publishedDateString!.substring(0, 4)}"
                          : "",
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    )),
                const Divider(),
                book.smallThumbnailSrc != null
                    ? SizedBox(
                        height: 180.0,
                        child: Center(
                            child: Image.network(book.smallThumbnailSrc!)))
                    : const SizedBox(),
                book.smallThumbnailSrc != null
                    ? const Divider()
                    : const SizedBox(),
                Flex(
                    verticalDirection: VerticalDirection.down,
                    direction: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          child: SizedBox(
                              height: 72.0,
                              child: Column(
                                children: [
                                  IconButton(
                                    icon:
                                        const Icon(Icons.bookmark_add_outlined),
                                    iconSize: 32.0,
                                    onPressed: () => {},
                                  ),
                                  const Text(
                                    "Tambahkan",
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ))),
                      Visibility(
                          visible: false,
                          child: Expanded(
                              child: SizedBox(
                                  height: 72.0,
                                  child: Column(
                                    children: [
                                      TextButton(
                                        child: const Text("19%",
                                            style:
                                                TextStyle(color: Colors.black)),
                                        onPressed: () => {},
                                      ),
                                      const Text(
                                        "Update Progres",
                                        textAlign: TextAlign.center,
                                      )
                                    ],
                                  )))),
                      Expanded(
                          child: SizedBox(
                              height: 72.0,
                              child: Column(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.share),
                                    iconSize: 32.0,
                                    onPressed: () => {},
                                  ),
                                  const Text(
                                    "Bagikan",
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ))),
                    ]),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    book.description ?? "",
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),
                const Divider(),
              ],
            ));
  }
}
