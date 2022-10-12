enum BookLogEventType {
  addedToList,
  updatedBookReadingProgress,
  finishedReading,
  startedReading,
}

class BookLog {
  String googleBooksVolumeId;
  String time;
  BookLogEventType eventType;

  BookLog({
    required this.googleBooksVolumeId,
    required this.time,
    required this.eventType,
  });

  Map<String, Object?> toMap() {
    return <String, Object?>{
      "google_books_volume_id": googleBooksVolumeId,
      "time": time,
      "event_type": eventType.name,
    };
  }
}
