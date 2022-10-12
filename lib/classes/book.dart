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
    var volumeInfo = json['volumeInfo'];
    return Book(
      //perlu diperbaiki
      id: json["id"] as String?,
      etag: json["etag"] as String?,
      title: volumeInfo["title"] as String?,
      // authors: volumeInfo["authors"].cast<String>(),
      authors: volumeInfo["authors"] != null
          ? (volumeInfo['authors'] as List<dynamic>)
              .map((author) => author.toString())
              .toList()
          : [''],
      publisher: volumeInfo["publisher"] as String?,
      publishedDateString: volumeInfo["publishedDate"] as String?,
      description: volumeInfo["description"] as String?,
      pageCount: volumeInfo["pageCount"] as int?,
      thumbnailSrc: volumeInfo["imageLinks"] != null
          ? '${volumeInfo['imageLinks']['thumbnail']}'
          : 'https://i.ibb.co/h8pD6X3/image-2.jpg',
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
      "thumbnailSrc": thumbnailSrc
    };
  }
}
