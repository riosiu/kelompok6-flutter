import 'package:booktrackers/classes/book_log.dart';
import 'package:booktrackers/helpers/init_db.dart';
import 'package:sqflite/sqflite.dart';

class BookLogService {
  static Future<void> log(BookLog bookLog) async {
    try {
      final Database db = await initDb();
      await db.insert("book_log", bookLog.toMap());
    } catch (e) {
      rethrow;
    }
  }
}
