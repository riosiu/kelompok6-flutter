import 'dart:convert';

import 'package:booktrackers/classes/book.dart';
import 'package:booktrackers/helpers/init_db.dart';
import 'package:http/http.dart';
import 'package:sqflite/sqflite.dart';

class SavedBook {
  int id;
  String googleBooksVolumeId;
  int page;
  DateTime? startedReading;
  DateTime? finishedReading;

  SavedBook(
      {required this.id,
      required this.googleBooksVolumeId,
      this.page = 0,
      this.startedReading,
      this.finishedReading});

  static Future<int> add(Book book) async {
    final Database db = await initDb();

    return await db.insert("saved_book", <String, Object?>{
      "google_books_volume_id": book.id,
      "page": 0,
    });
  }

  static Future<List<SavedBook>> getMany() async {
    final Database db = await initDb();
    final queryResult = await db.query("saved_book");
    final List<SavedBook> savedBooks = queryResult
        .map((item) => SavedBook(
              id: item["id"] as int,
              googleBooksVolumeId: item["google_books_volume_id"] as String,
              page: item["page"] as int,
              // startedReading:
              //     DateTime.parse(item["started_reading"] as String? ?? ""),
              // finishedReading:
              //     DateTime.parse(item["finished_reading"] as String? ?? ""),
            ))
        .toList();

    return savedBooks;
  }

  static Future<SavedBook> getOneByGoogleBooksVolumeId(
      String googleBooksVolumeId) async {
    final Database db = await initDb();
    // List<Map<String, Object?>> queryResult = await db.query("saved_book",
    //     where: "google_books_volume_id = ?", whereArgs: [googleBooksVolumeId]);
    List<Map<String, Object?>> queryResult = await db.rawQuery(
        'SELECT * FROM "saved_book" WHERE "google_books_volume_id" = "$googleBooksVolumeId";');

    if (queryResult.isEmpty || queryResult == null) {
      throw "data not found";
    }

    return SavedBook(
        id: queryResult[0]["id"] as int,
        googleBooksVolumeId: queryResult[0]["google_books_volume_id"] as String,
        page: queryResult[0]["page"] as int);
  }

  Future<Book> toBook() async {
    final response = await get(Uri.parse(
        "https://www.googleapis.com/books/v1/volumes/$googleBooksVolumeId"));
    final json = jsonDecode(response.body);

    return Book.fromJson(json);
  }

  Future<SavedBook> updateProgress(int page) async {
    final Database db = await initDb();
    final result = await db.update("saved_book", <String, Object?>{
      "google_books_volume_id": googleBooksVolumeId,
      "page": page,
    });
    this.page = page;

    return this;
  }
}
