import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '../routes/route_generator.dart'; // Import RouteGenerator for route constants

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
            Navigator.pushNamed(context, RouteGenerator.home);
            break;
          case 1:
            Navigator.pushNamed(context, RouteGenerator.members);
            break;
          case 2:
            Navigator.pushNamed(context, RouteGenerator.add);
            break;
          case 3:
            Navigator.pushNamed(context, RouteGenerator.reports);
            break;
          case 4:
            Navigator.pushNamed(context, RouteGenerator.menu);
            break;
          default:
            // Optionally handle unexpected indices
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
