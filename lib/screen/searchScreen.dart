import 'package:flutter/material.dart';

class SearchBooks extends StatefulWidget {
  const SearchBooks({super.key});

  @override
  State<SearchBooks> createState() => _SearchBooksState();
}

class _SearchBooksState extends State<SearchBooks> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: TextFormField(
          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(
              hintStyle: TextStyle(color: Colors.white),
              prefixIcon: Icon(Icons.search, color: Colors.white),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 1.0)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 1.0)),
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 1.0)),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 1.0)),
              hintText: "Cari berdasarkan judul atau ISBN"),
        ));
  }
}
