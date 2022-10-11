import 'package:booktrackers/screens/achievements_screen.dart';
import 'package:booktrackers/screens/others_screen.dart';
import 'package:flutter/material.dart';
import 'package:booktrackers/screens/home_screen.dart';
import 'package:booktrackers/screens/saved_screen.dart';
import 'package:booktrackers/screens/search_screen.dart';

class MyBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ThemeData theme;

  MyBottomNavigationBar(
      {super.key, required this.currentIndex, required this.theme});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Theme.of(context).primaryColor,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "Cari"),
        BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: "Tersimpan"),
        BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: "Lainnya"),
      ],
      currentIndex: currentIndex,
      selectedItemColor: Colors.white,
      showUnselectedLabels: true,
      unselectedItemColor: Colors.white54,
      onTap: (selectedIndex) {
        if (currentIndex != selectedIndex) {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            switch (selectedIndex) {
              case 0:
                return HomeScreen();
              case 1:
                return const SearchScreen();
              case 2:
                return const SavedScreen();
              case 3:
                return const AchievementsScreen();
              default:
                return HomeScreen();
            }
          }));
        }
      },
    );
  }
}
