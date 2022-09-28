import 'package:flutter/material.dart';

class SearchIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const SearchIcon({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: true,
      decoration: InputDecoration(
          hintText: 'Cari Buku',
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)))),
    );
  }
}
