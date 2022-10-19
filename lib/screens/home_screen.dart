import 'package:booktrackers/services/saved_book_service.dart';
import 'package:booktrackers/widget/future_book_card.dart';
import 'package:flutter/material.dart';
import 'package:booktrackers/widget/my_bottom_navigation_bar.dart';
import 'package:booktrackers/helpers/theme.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  Future<List<SavedBook>>? _savedBooks;

  Future<List<SavedBook>> fetchSavedBooks() async {
    return await SavedBook.getMany();
  }

  Widget bookCardListBuilder() {
    return FutureBuilder<List<SavedBook>>(
        future: _savedBooks,
        builder: (((context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          if (snapshot.data != null) {
            return ListView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: snapshot.data!.length,
                itemBuilder: ((context, index) {
                  SavedBook currentIndexSavedBook = snapshot.data![index];

                  return FutureBookCard(
                    savedBook: currentIndexSavedBook,
                    savedBookSetter: futureSavedBooksSetter,
                  );
                }));
          }

          return const Center(child: CircularProgressIndicator());
        })));
  }

  void futureSavedBooksSetter() {
    _savedBooks = null;
    _savedBooks = fetchSavedBooks();
  }

  @override
  void initState() {
    _savedBooks = fetchSavedBooks();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: Theme.of(context).primaryColor,
                automaticallyImplyLeading: false,
                expandedHeight: 340.0,
                floating: false,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage("assets/images/hero-bg.png"),
                        fit: BoxFit.fill,
                      )),
                      // margin: const EdgeInsets.all(16),
                      child: Column(children: <Widget>[
                        Center(
                          child: Container(
                              margin:
                                  const EdgeInsets.only(top: 128, bottom: 16),
                              child: const Image(
                                image: AssetImage('assets/images/logotext.png'),
                                height: 80,
                              )),
                        ),
                        Container(
                            margin: const EdgeInsets.only(bottom: 48),
                            child: Chip(
                              label: Column(children: [
                                Text("Level 12"),
                                Text(
                                  "420xp",
                                  style: TextStyle(fontSize: 8),
                                )
                              ]),
                              avatar: CircularProgressIndicator(
                                strokeWidth: 3.0,
                                value: 0.41,
                                color: Theme.of(context).primaryColor,
                                backgroundColor: Colors.black12,
                              ),
                            )),
                      ])),
                ),
              )
            ];
          },
          body: ListView(
            children: <Widget>[
              Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: const Text("Lanjut membaca",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Colors.black54))),
              bookCardListBuilder()
            ],
          ),
        ),
        bottomNavigationBar: MyBottomNavigationBar(
          currentIndex: 0,
          theme: theme,
        ));
  }
}
