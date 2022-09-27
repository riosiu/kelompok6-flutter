import 'package:flutter/material.dart';

class BookBottomSheet extends StatelessWidget {
  const BookBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: 0.6,
        expand: false,
        builder: (context, scrollController) => ListView(
              controller: scrollController,
              children: [
                ListTile(
                  title: const Text("Nineteen Eighty-four"),
                  subtitle: Text(
                    1949.toString(),
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),
                const Divider(),
                SizedBox(
                    height: 180.0,
                    child: Center(
                        child: Image.network(
                            "http://books.google.com/books/content?id=JT_JDAAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api"))),
                const Divider(),
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
                    "description " * 100,
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),
                const Divider(),
                const ListTile(
                  title: Text('Title 2'),
                ),
                const Divider(),
                const ListTile(
                  title: Text('Title 3'),
                ),
                const Divider(),
                const ListTile(
                  title: Text('Title 4'),
                ),
                const Divider(),
                const ListTile(
                  title: Text('Title 5'),
                ),
              ],
            ));
  }
}
