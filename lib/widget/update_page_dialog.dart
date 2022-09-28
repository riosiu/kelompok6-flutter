import 'package:booktrackers/classes/book.dart';
import 'package:booktrackers/services/saved_book_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UpdatePageDialog extends StatefulWidget {
  final SavedBook savedBook;
  final Book book;

  const UpdatePageDialog(
      {Key? key, required this.savedBook, required this.book})
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
            child: const Text("Batalkan")),
        TextButton(
            onPressed: () {
              widget.savedBook
                  .updateProgress(int.parse(_pageNumberInputController.text));
              Navigator.pop(context);
            },
            child: const Text("Simpan")),
      ],
    );
  }
}
