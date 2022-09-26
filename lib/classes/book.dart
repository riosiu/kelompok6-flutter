class Book {
  final String? id;
  final String? etag;
  final String? title;
  final List<String>? authors;
  final String? publisher;
  final String? publishedDateString;
  final String? description;
  final int? pageCount;
  final String? smallThumbnailSrc;

  const Book(
      {this.id,
      this.etag,
      this.title,
      this.authors,
      this.publisher,
      this.publishedDateString,
      this.description,
      this.pageCount,
      this.smallThumbnailSrc});

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json["id"],
      etag: json["etag"],
      title: json["volumeInfo"]?["title"],
      // authors: (json["volumeInfo"]?["authors"]) as List<String>,
      authors: [],
      publisher: json["volumeInfo"]?["publisher"],
      publishedDateString: json["volumeInfo"]?["publishedDate"],
      description: json["volumeInfo"]?["description"],
      pageCount: json["volumeInfo"]?["pageCount"],
      smallThumbnailSrc: json["volumeInfo"]?["smallThumbnail"],
    );
  }
}
