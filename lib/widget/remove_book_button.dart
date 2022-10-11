import 'package:booktrackers/classes/book.dart';
import 'package:booktrackers/screens/saved_screen.dart';
import 'package:booktrackers/services/remove_book_service.dart';
import 'package:booktrackers/services/saved_book_service.dart';
import 'package:booktrackers/widget/update_page_dialog.dart';
import 'package:flutter/material.dart';

class RemovedBookButton extends StatelessWidget {
  final RemovedBook? removedBook;

  const RemovedBookButton({
    Key? key,
    required this.removedBook,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text('Hapus'),
    );
  }
}
