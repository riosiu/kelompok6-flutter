import 'package:booktrackers/services/saved_book_service.dart';
import 'package:booktrackers/widget/future_book_card.dart';
import 'package:flutter/material.dart';
import 'package:booktrackers/helpers/theme.dart';
import 'package:booktrackers/widget/my_bottom_navigation_bar.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({Key? key}) : super(key: key);

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
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
                itemCount: snapshot.data!.length,
                itemBuilder: ((context, index) {
                  SavedBook currentIndexSavedBook = snapshot.data![index];

                  return FutureBookCard(
                    savedBook: currentIndexSavedBook,
                  );
                }));
          }

          return const Center(child: CircularProgressIndicator());
        })));
  }

  @override
  void initState() {
    _savedBooks = fetchSavedBooks();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: null,
          automaticallyImplyLeading: false,
          title: const Text("Daftar tersimpan"),
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Colors.white,
        ),
        body: bookCardListBuilder(),
        bottomNavigationBar: MyBottomNavigationBar(
          currentIndex: 2,
          theme: theme,
        ));
  }
}
