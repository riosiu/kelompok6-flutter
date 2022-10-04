class Book {
  final String? id;
  final String? etag;
  final String? title;
  final List<String>? authors;
  final String? publisher;
  final String? publishedDateString;
  final String? description;
  final int? pageCount;
  final String? thumbnailSrc;

  const Book(
      {this.id,
      this.etag,
      this.title,
      this.authors,
      this.publisher,
      this.publishedDateString,
      this.description,
      this.pageCount,
      this.thumbnailSrc});

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json["id"] as String?,
      etag: json["etag"] as String?,
      title: json["volumeInfo"]["title"] as String?,
      authors: json["volumeInfo"]["authors"].cast<String>(),
      publisher: json["volumeInfo"]["publisher"] as String?,
      publishedDateString: json["volumeInfo"]["publishedDate"] as String?,
      description: json["volumeInfo"]["description"] as String?,
      pageCount: json["volumeInfo"]["pageCount"] as int?,
      thumbnailSrc: json["volumeInfo"]["imageLinks"]["thumbnail"] as String?,
    );
  }

  Map<String, Object?> toMap() {
    return <String, Object?>{
      "id": id,
      "etag": etag,
      "title": title,
      "authors": authors,
      "publisher": publisher,
      "publishedDateString": publishedDateString,
      "description": description,
      "pageCount": pageCount,
      "smallThumbnailSrc": smallThumbnailSrc
    };
  }
}
