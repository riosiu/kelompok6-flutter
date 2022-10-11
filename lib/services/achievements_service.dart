import 'dart:math';

import 'package:booktrackers/classes/book_log.dart';
import 'package:booktrackers/helpers/init_db.dart';
import 'package:sqflite/sqflite.dart';

class AchievementsService {
  static Future<double> getXP() async {
    double xp;
    try {
      final Database db = await initDb();
      final finishedReadingCount = Sqflite.firstIntValue(await db.query(
          "book_log",
          columns: ["COUNT()"],
          where: 'event_type = "${BookLogEventType.finishedReading.name}"'));

      if (finishedReadingCount == null) throw "query failed";

      xp = finishedReadingCount * 100;
    } catch (e) {
      rethrow;
    }

    return xp;
  }

  static int getLevelByXp(double xp) {
    final double solution1 =
        (150 + sqrt(pow(150, 2) - (4 * 150 * (-xp)))) / (2 * 150);
    final double solution2 =
        (150 - sqrt(pow(150, 2) - (4 * 150 * (-xp)))) / (2 * 150);

    return solution1 >= 0 ? solution1.toInt() : solution2.toInt();
  }
}
