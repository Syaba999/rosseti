import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

class BottomNavigation extends StatelessWidget {
  final Function(int) onItemTapped;
  final int selectedIndex;

  const BottomNavigation({Key key, this.onItemTapped, this.selectedIndex})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(FontAwesome5.atom),
          label: 'Рацдеятельность',
        ),
        BottomNavigationBarItem(
          icon: Icon(Entypo.chat),
          label: 'Общение',
        ),
      ],
      currentIndex: selectedIndex,
      onTap: onItemTapped,
    );
  }
}
