import 'dart:convert';

import 'package:booktrackers/classes/book.dart';
import 'package:booktrackers/helpers/init_db.dart';
import 'package:http/http.dart';
import 'package:sqflite/sqflite.dart';

class SavedBook {
  final String id;
  final String googleBooksVolumeId;
  final int page;
  final DateTime? startedReading;
  final DateTime? finishedReading;

  SavedBook(
      {required this.id,
      required this.googleBooksVolumeId,
      this.page = 0,
      this.startedReading,
      this.finishedReading});

  static Future<int> add(Book book) async {
    final Database db = await initDb();

    return await db.insert("saved_book", book.toMap());
  }

  static Future<List<SavedBook>> getMany() async {
    final Database db = await initDb();
    final queryResult = await db.query("saved_book");
    final List<SavedBook> savedBooks = queryResult
        .map((item) => SavedBook(
            id: item["id"] as String,
            googleBooksVolumeId: item["google_books_volume_id"] as String,
            page: item["page"] as int,
            startedReading: DateTime.parse(item["started_reading"] as String),
            finishedReading:
                DateTime.parse(item["finished_reading"] as String)))
        .toList();

    return savedBooks;
  }

  Future<Book> toBook() async {
    final response = await get(Uri.parse(
        "https://www.googleapis.com/books/v1/volumes/$googleBooksVolumeId"));
    final json = jsonDecode(response.body);
    
    return Book.fromJson(json);
  }
}
