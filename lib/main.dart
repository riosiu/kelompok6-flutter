import 'package:belajar_flutter/screen/list_view_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: Colors.teal[900],
          appBarTheme: const AppBarTheme(foregroundColor: Colors.black)),
      home: const MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    SafeArea(child: ListViewHome()),
    Text(
      'Index 1: Search',
      style: optionStyle,
    ),
    Text(
      'Index 2: Librari',
      style: optionStyle,
    ),
    Text(
      'Index 2: Lainnya',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.teal[900], // <-- SEE HERE
          statusBarIconBrightness:
              Brightness.light, //<-- For Android SEE HERE (dark icons)
          statusBarBrightness: Brightness.light,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Cari Buku',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Tersimpan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Lainnya',
          ),
        ],
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        showUnselectedLabels: true,
        backgroundColor: Colors.teal[900],
        unselectedItemColor: Colors.white54,
        onTap: _onItemTapped,
      ),
    );
  }
}
