import 'package:flutter/material.dart';

class MissionListItem extends StatelessWidget {
  final double currentXp;
  final double minimumXp;
  final String missionTitle;

  const MissionListItem({
    Key? key,
    required this.currentXp,
    required this.missionTitle,
    required this.minimumXp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        currentXp >= minimumXp ? Icons.flag : Icons.flag_outlined,
        size: 36,
        color: currentXp >= minimumXp
            ? Theme.of(context).primaryColor
            : Colors.black26,
      ),
      title: Text(missionTitle),
      subtitle: Text("minimal $currentXp xp"),
    );
  }
}
