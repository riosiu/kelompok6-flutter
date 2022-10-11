import 'package:booktrackers/helpers/theme.dart';
import 'package:booktrackers/services/achievements_service.dart';
import 'package:booktrackers/widget/mission_list_item.dart';
import 'package:booktrackers/widget/my_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class AchievementsScreen extends StatefulWidget {
  const AchievementsScreen({super.key});

  @override
  State<AchievementsScreen> createState() => _AchievementsScreenState();
}

class _AchievementsScreenState extends State<AchievementsScreen> {
  double? xp;

  void initLoad() async {
    double result = await AchievementsService.getXP();

    setState(() {
      xp = result;
    });
  }

  @override
  void initState() {
    super.initState();

    initLoad();
  }

  @override
  Widget build(BuildContext context) {
    var currentLevel = AchievementsService.getLevelByXp(xp!);

    return Scaffold(
        body: xp != null
            ? NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
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
                              value: xp! /
                                  (((currentLevel + 1) / 2) *
                                      (currentLevel * 300)),
                              backgroundColor: Colors.black12),
                          title: Text("Level $currentLevel"),
                          subtitle: Text("${xp!} xp"),
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
                      MissionListItem(
                          currentXp: xp!,
                          minimumXp: 100,
                          missionTitle: "Menyelesaikan 1 buku"),
                      MissionListItem(
                          currentXp: xp!,
                          minimumXp: 100 * 5,
                          missionTitle: "Menyelesaikan 5 buku"),
                      MissionListItem(
                          currentXp: xp!,
                          minimumXp: 100 * 10,
                          missionTitle: "Menyelesaikan 10 buku"),
                      MissionListItem(
                          currentXp: xp!,
                          minimumXp: 100 * 30,
                          missionTitle: "Menyelesaikan 30 buku"),
                    ],
                  ),
                ),
              )
            : const SizedBox(),
        bottomNavigationBar: MyBottomNavigationBar(
          currentIndex: 3,
          theme: theme,
        ));
  }
}
