import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class CustomFooter extends StatelessWidget {
  final int currentIndex;
  final Function(int) onItemTapped;

  const CustomFooter({
    Key? key,
    required this.currentIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      index: currentIndex,
      onTap: onItemTapped,
      backgroundColor: Colors.transparent, // Background for animation
      color: const Color.fromARGB(255, 137, 142, 204),
      buttonBackgroundColor: const Color.fromARGB(255, 198, 135, 135),
      height: 60,
      animationDuration: const Duration(milliseconds: 300),
      items: const [
        Icon(Icons.home, size: 30, color: Colors.black),
        Icon(Icons.group, size: 30, color: Colors.black),
        Icon(Icons.add_circle, size: 35, color: Colors.black),
        Icon(Icons.bar_chart, size: 30, color: Colors.black),
        Icon(Icons.menu, size: 30, color: Colors.black),
      ],
    );
  }
}
