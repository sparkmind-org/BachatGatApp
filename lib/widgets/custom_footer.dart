import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:go_router/go_router.dart';
import '../routes/router.dart';

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
      onTap: (index) {
        onItemTapped(index);
        switch (index) {
          case 0:
            context.go(Routes.home);
            break;
          case 1:
            context.go(Routes.members);
            break;
          case 2:
            context.go(Routes.add);
            break;
          case 3:
            context.go(Routes.reports);
            break;
          case 4:
            context.go(Routes.menu);
            break;
          default:
            break;
        }
      },
      backgroundColor: Colors.transparent,
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