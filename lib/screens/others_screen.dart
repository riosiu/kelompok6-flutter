import 'package:booktrackers/helpers/theme.dart';
import 'package:booktrackers/widget/my_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class OthersScreen extends StatefulWidget {
  const OthersScreen({super.key});

  @override
  State<OthersScreen> createState() => _OthersScreenState();
}

class _OthersScreenState extends State<OthersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: Theme.of(context).primaryColor,
                automaticallyImplyLeading: false,
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: const Text(
                      "Achievements",
                    ),
                    background: Image.network(
                      "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                      fit: BoxFit.cover,
                    )),
              ),
            ];
          },
          body: Center(
            child: ListView(
              children: [
                Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    child: const Text("Progress",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Colors.black54))),
                Card(
                  clipBehavior: Clip.antiAlias,
                  child: ListTile(
                    leading: CircularProgressIndicator(
                        color: Theme.of(context).primaryColor,
                        value: 0.35,
                        backgroundColor: Colors.black12),
                    title: const Text("Level 2"),
                    subtitle: const Text("122 xp"),
                  ),
                ),
                Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    child: const Text("Mission",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Colors.black54))),
                const ListTile(
                  leading: Icon(Icons.military_tech, size: 36),
                  title: Text("Menyelesaikan 1 buku"),
                  subtitle: Text("122 xp"),
                ),
                const ListTile(
                  leading: Icon(Icons.military_tech, size: 36),
                  title: Text("Menyelesaikan 5 buku"),
                  subtitle: Text("122 xp"),
                ),
                const ListTile(
                  leading: Icon(Icons.military_tech, size: 36),
                  title: Text("Menyelesaikan 10 buku"),
                  subtitle: Text("122 xp"),
                ),
                const ListTile(
                  leading: Icon(Icons.military_tech, size: 36),
                  title: Text("Menyelesaikan 30 buku"),
                  subtitle: Text("122 xp"),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: MyBottomNavigationBar(
          currentIndex: 3,
          theme: theme,
        ));
  }
}
