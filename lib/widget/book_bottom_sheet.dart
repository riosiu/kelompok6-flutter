import 'package:booktrackers/classes/book.dart';
import 'package:booktrackers/widget/detail_widget/author_widget.dart';
import 'package:booktrackers/widget/detail_widget/description_widget.dart';
import 'package:booktrackers/widget/detail_widget/row_widget_detail_book.dart';
import 'package:booktrackers/widget/detail_widget/title_widget.dart';
import 'package:flutter/material.dart';

class BookBottomSheet extends StatelessWidget {
  final Book book;

  const BookBottomSheet({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        color: Color(0xFF737373).withOpacity(0),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.80,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32.0),
                  topRight: Radius.circular(32.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: (180 / 2) + 20, left: 16.0, right: 16.0),
                child: Column(
                  children: [
                    AuthorWidget(book),
                    SizedBox(height: 10.0),
                    TitleWidget(book),
                    Divider(),
                    DescriptionBookWidget(book),
                    SizedBox(height: 10.0),
                    Divider(),
                    SizedBox(height: 10.0),
                    // RowdataWidget(book),
                    SizedBox(height: 10.0),
                    Divider(),
                  ],
                ),
              ),
            ),
            Positioned(
              top: -180 / 2,
              child: Card(
                elevation: 10.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                child: Container(
                  width: 100,
                  height: 150,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      book.thumbnailSrc!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 25,
              top: 20,
              child: IconButton(
                icon: Icon(Icons.share),
                onPressed: () {},
              ),
            ),
            Positioned(
              right: 20,
              top: 20,
              child: IconButton(
                icon: Icon(Icons.bookmark),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
