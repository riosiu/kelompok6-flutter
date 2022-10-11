import 'package:booktrackers/helpers/init_db.dart';
import 'package:sqflite/sqflite.dart';

class RemovedBook {
  int id;

  RemovedBook({
    required this.id,
  });
  static Future<void> deleteBook(String id) async {
    final Database db = await initDb();

    await db.delete(
      'bookshelf',
      where: "bookId = ?",
      whereArgs: [id],
    );
  }

  Future<void> removeSavedBook(String id) async {
    await RemovedBook.deleteBook(id);
  }
}
