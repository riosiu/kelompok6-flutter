import 'dart:convert';

import 'package:booktrackers/classes/book.dart';
import 'package:flutter/material.dart';
import 'package:booktrackers/helpers/theme.dart';
import 'package:booktrackers/widget/book_card.dart';
import 'package:booktrackers/widget/my_bottom_navigation_bar.dart';
import 'package:http/http.dart';

class SearchScreen extends StatefulWidget {
  final String initialSearchKeyword;

  const SearchScreen({Key? key, this.initialSearchKeyword = ""})
      : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchKeywordInputController =
      TextEditingController(text: "");
  bool _appBarIsExpanded = false;
  String _searchKeyword = "";
  bool _isLoading = false;
  bool _isError = false;
  Future<List<Book>>? _futureBooks;

  @override
  void initState() {
    _searchKeyword = widget.initialSearchKeyword;
    super.initState();
  }

  @override
  void dispose() {
    _searchKeywordInputController.dispose();
    super.dispose();
  }

  Future<List<Book>> fetchBooksBySearchKeyword(String searchKeyword) async {
    final response = await get(
        Uri.parse("https://www.googleapis.com/books/v1/volumes")
            .replace(queryParameters: {"q": searchKeyword}));
    if (response.statusCode == 200) {
      return (jsonDecode(response.body)["items"] as List<dynamic>)
          .map(((item) => Book.fromJson(item)))
          .toList();
    } else {
      throw Exception('Failed to load album');
    }
  }

  searchNotExpandedAppBar(BuildContext context) {
    return AppBar(
      leading: _searchKeyword.isNotEmpty
          ? IconButton(
              onPressed: (() {
                setState(() {
                  _searchKeyword = "";
                });
              }),
              icon: const Icon(Icons.arrow_back))
          : null,
      automaticallyImplyLeading: false,
      backgroundColor: Theme.of(context).primaryColor,
      title:
          Text(_searchKeyword.isNotEmpty ? '"$_searchKeyword"' : "Pencarian"),
      actions: [
        IconButton(
            onPressed: (() {
              setState(() {
                _appBarIsExpanded = true;
                _searchKeywordInputController.text = _searchKeyword;
              });
            }),
            icon: const Icon(Icons.search))
      ],
      foregroundColor: Colors.white,
    );
  }

  searchExpandedAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black54,
      leading: IconButton(
          onPressed: (() {
            setState(() {
              _appBarIsExpanded = false;
            });
          }),
          icon: const Icon(Icons.arrow_back)),
      automaticallyImplyLeading: false,
      title: TextField(
        controller: _searchKeywordInputController,
        cursorColor: Theme.of(context).primaryColor,
        decoration: const InputDecoration(
          hintText: "contoh: harry potter, 9780151660346",
          border: InputBorder.none,
        ),
        onSubmitted: (value) {
          if (_searchKeywordInputController.text.isNotEmpty) {
            setState(() {
              _appBarIsExpanded = false;
              _searchKeyword = _searchKeywordInputController.text;
            });
          }
        },
      ),
      actions: [
        IconButton(
            onPressed: ((() {
              setState(() {
                _searchKeywordInputController.text = "";
              });
            })),
            icon: const Icon(Icons.close)),
        IconButton(
            onPressed: ((() {
              if (_searchKeywordInputController.text.isNotEmpty) {
                setState(() {
                  _appBarIsExpanded = false;
                  _searchKeyword = _searchKeywordInputController.text;
                  _futureBooks = fetchBooksBySearchKeyword(
                      _searchKeywordInputController.text);
                });
              }
            })),
            icon: const Icon(Icons.search))
      ],
    );
  }

  Widget buildBookList() {
    return FutureBuilder<List<Book>>(
        future: _futureBooks,
        builder: (((context, snapshot) {
          if (ConnectionState.active != null && !snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          // WHEN THE CALL IS DONE BUT HAPPENS TO HAVE AN ERROR
          if (ConnectionState.done != null && snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: ((context, index) {
                  String title = snapshot.data![index].title ?? "";
                  int year = DateTime.parse(
                          snapshot.data![index].publishedDateString ??
                              "2022-01-01 00:00:00")
                      .year;
                  String description = snapshot.data![index].description ?? "";
                  return BookCard(
                      title: title,
                      year: year,
                      coverImageSrc: snapshot.data![index].smallThumbnailSrc,
                      description: description);
                }));
          }

          return const Center(child: CircularProgressIndicator());
        })));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBarIsExpanded
            ? searchExpandedAppBar(context)
            : searchNotExpandedAppBar(context),
        body: _searchKeyword.isNotEmpty
            ? buildBookList()
            : Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.search,
                    size: 128.0,
                    color: Colors.black26,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const Text(
                    "Cari berdasarkan judul atau ISBN",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18.0, color: Colors.black26),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextButton(
                      onPressed: (() {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SearchScreen(
                                  initialSearchKeyword: "harry potter",
                                )));
                      }),
                      child: const Text('Cari "harry potter"')),
                  const SizedBox(
                    height: 4,
                  ),
                  TextButton(
                      onPressed: (() {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SearchScreen(
                                  initialSearchKeyword: "9780151660346",
                                )));
                      }),
                      child: const Text('Cari "9780151660346"')),
                ],
              )),
        bottomNavigationBar: MyBottomNavigationBar(
          currentIndex: 1,
          theme: theme,
        ));
  }
}
