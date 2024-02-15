import 'package:flutter/material.dart';
import 'package:stream/ui/saved_anime_list.dart';

class BottomMenu extends StatefulWidget {
  final int currentIndex;
  final ValueChanged<int> onItemTapped;
  const BottomMenu({
    Key? key,
    required this.currentIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  State<BottomMenu> createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.currentIndex, //New
      iconSize: 24,
      onTap: widget.onItemTapped,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          backgroundColor: Colors.blueAccent,
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.blueAccent,
          icon: Icon(Icons.bookmark),
          label: 'Saved',
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.blueAccent,
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}
