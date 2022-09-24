import 'package:booktracers/widget/searchIcon.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.teal[900],
            title: Text(
              'Find Book',
              style: const TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.w400,
                letterSpacing: 2.5,
              ),
            ),
            centerTitle: false,
            floating: true,
            actions: [],
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.only(top: 2),
              child: TextField(
                decoration: InputDecoration(
                    suffixIcon: Icon(Icons.search, color: Colors.teal),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.teal),
                    ),
                    hintText: 'Contoh : The Rich Poor Man'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
