import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> initDb() async {
  var databasesPath = await getDatabasesPath();
  String path = join(databasesPath, 'booktracker.db');

  Database db = await openDatabase(path, version: 1, onCreate: ((db, version) {
    return db.execute(
        "CREATE TABLE saved_book(id INTEGER PRIMARY KEY AUTOINCREMENT, google_books_volume_id TEXT, page INTEGER, started_reading TEXT, finished_reading TEXT, UNIQUE(google_books_volume_id))");
  }));

  return db;
}
