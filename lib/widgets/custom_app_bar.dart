import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;

  const CustomAppBar({
    super.key,
    required this.title,
    this.showBackButton = false, // Defaults to no back button
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 4, // Slight shadow for depth
      centerTitle: true,
      automaticallyImplyLeading: false, // Prevent default back button
      backgroundColor: Colors.transparent,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 210, 197, 223), // Purple
              Color.fromARGB(255, 176, 184, 198), // Blue
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
      leading: showBackButton
          ? IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          : null, // No leading widget if back button isn't needed
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        Stack(
          children: [
            IconButton(
              icon: SvgPicture.asset(
                'assets/icon/Bellicon.svg',
                height: 24,
                width: 24,
                
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/notification');
              },
            ),
            // Badge for notifications
            Positioned(
              right: 6,
              top: 0,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: const Text(
                  '2',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
