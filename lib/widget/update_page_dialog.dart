import 'package:booktrackers/classes/book.dart';
import 'package:booktrackers/classes/book_log.dart';
import 'package:booktrackers/services/book_log_service.dart';
import 'package:booktrackers/services/saved_book_service.dart';
import 'package:booktrackers/widget/remove_book_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UpdatePageDialog extends StatefulWidget {
  final SavedBook savedBook;
  final Book book;
  final Function? savedBookSetter;

  const UpdatePageDialog(
      {Key? key,
      required this.savedBook,
      required this.book,
      this.savedBookSetter})
      : super(key: key);

  @override
  State<UpdatePageDialog> createState() => _UpdatePageDialogState();
}

class _UpdatePageDialogState extends State<UpdatePageDialog> {
  final TextEditingController _pageNumberInputController =
      TextEditingController(text: '0');

  @override
  void initState() {
    _pageNumberInputController.text = widget.savedBook.page.toString();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Update halaman"),
      content: Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              width: 64,
              child: TextField(
                  controller: _pageNumberInputController,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ])),
          Text("/ ${widget.book.pageCount}")
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Batalkan"),
        ),
        TextButton(
            onPressed: () {
              widget.savedBook
                  .updateProgress(int.parse(_pageNumberInputController.text));
              if (widget.book.pageCount ==
                  int.parse(_pageNumberInputController.text)) {
                BookLogService.log(BookLog(
                    googleBooksVolumeId: widget.savedBook.googleBooksVolumeId,
                    time: DateTime.now().toIso8601String(),
                    eventType: BookLogEventType.finishedReading));
              } else {
                BookLogService.log(BookLog(
                    googleBooksVolumeId: widget.savedBook.googleBooksVolumeId,
                    time: DateTime.now().toIso8601String(),
                    eventType: BookLogEventType.updatedBookReadingProgress));
              }
              if (widget.savedBookSetter != null) {
                widget.savedBookSetter!();
              }
              Navigator.pop(context);
            },
            child: const Text("Simpan")),
      ],
    );
  }
}
