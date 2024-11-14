import 'package:flutter/material.dart';
import '../../widgets/custom_footer.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  int _selectedIndex = 4; // Assuming 'Menu' is the last item in the footer

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/home');
        break;
      case 1:
        Navigator.pushNamed(context, '/members');
        break;
      case 2:
        Navigator.pushNamed(context, '/add');
        break;
      case 3:
        Navigator.pushNamed(context, '/reports');
        break;
      case 4:
        Navigator.pushNamed(context, '/menu');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Account'),
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black),
        titleTextStyle: const TextStyle(color: Colors.black, fontSize: 20),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {
              // Add notification functionality here
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Profile section
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey[300],
                    child: const Icon(Icons.person, size: 50, color: Colors.white),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('ADMIN', style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(width: 8),
                      IconButton(
                        icon: const Icon(Icons.edit, size: 18, color: Colors.grey),
                        onPressed: () {
                          // Add edit profile functionality here
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // User details
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'NAME : Pratham babre',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 16),
                      Text(
                        'AGE : 21',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text('EMAIL : prathambabre733@gmail.com'),
                  const SizedBox(height: 8),
                  const Text('A/C : 927479487110'),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Options
            Expanded(
              child: ListView(
                children: [
                  _buildOptionItem('Bachat Gat Profiler', () {
                    // Add navigation or functionality here
                  }),
                  _buildOptionItem('Rules', () {
                    // Add navigation or functionality here
                  }),
                  _buildOptionItem('Sign-out', () {
                    // Add sign-out functionality here
                  }, isSignOut: true),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomFooter(
        currentIndex: _selectedIndex,
        onItemTapped: (index) {
          setState(() {
            _selectedIndex = index;
          });
          _onItemTapped(index);
        },
      ),
    );
  }

  Widget _buildOptionItem(String title, VoidCallback onTap, {bool isSignOut = false}) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          color: isSignOut ? Colors.red : Colors.black,
          fontWeight: isSignOut ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      onTap: onTap,
      trailing: isSignOut ? null : const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    );
  }
}
