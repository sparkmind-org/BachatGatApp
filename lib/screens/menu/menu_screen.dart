import 'package:flutter/material.dart';
import '../../widgets/custom_footer.dart'; // Import CustomFooter
import 'package:flutter_svg/flutter_svg.dart';


class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  int _selectedIndex = 4; // Assuming the 'Menu' section is the last tab in the footer.

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
        title: const Text('Settings'),
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black),
        titleTextStyle: const TextStyle(color: Colors.black, fontSize: 20),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/notification');
              },
              child: SvgPicture.asset(
                'assets/icon/Bellicon.svg',
                width: 24,
                height: 24,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Profile Section
          _buildProfileSection(),
          const SizedBox(height: 16),

          // Notifications Section
          _buildNotificationsSection(),
          const SizedBox(height: 16),

          // Group Management Section
          _buildGroupManagementSection(),
          const SizedBox(height: 16),

          // Language and Regional Settings
          _buildLanguageRegionalSection(),
          const SizedBox(height: 16),

          // Help & Support
          _buildHelpSupportSection(),
          const SizedBox(height: 16),

          // Feedback and About
          _buildFeedbackAboutSection(),
          const SizedBox(height: 16),

          // Logout Section
          _buildLogoutSection(),
        ],
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

Widget _buildProfileSection() {
  return Card(
    elevation: 2,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Stack(
        children: [
          Column(
            children: [
              // Center the CircleAvatar
              Center(
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.grey[300],
                  child: const Icon(Icons.person, size: 50, color: Colors.white),
                ),
              ),
              const SizedBox(height: 16),

              // Align text to the left
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Name : Pratham Babre',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Role : Admin',
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Email : prathambabre@gmail.com',
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Phone : 9008129336',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Position the edit icon in the top-right corner
          Positioned(
            top: 8,
            right: 8,
            child: IconButton(
              onPressed: () {
                // Add edit functionality here
              },
              icon: const Icon(Icons.edit, size: 20, color: Colors.black),
            ),
          ),
        ],
      ),
    ),
  );
}

  Widget _buildNotificationsSection() {
    return _buildCustomExpansionTile(
      title: 'Notifications',
      children: [
        SwitchListTile.adaptive(
          title: const Text('Push Notifications'),
          value: true,
          onChanged: (value) {
            // Handle toggle
          },
        ),
        SwitchListTile.adaptive(
          title: const Text('Email Notifications'),
          value: false,
          onChanged: (value) {
            // Handle toggle
          },
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Notification Categories:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        SwitchListTile.adaptive(
          title: const Text('Savings Reminders'),
          value: false,
          onChanged: (value) {
            // Handle toggle
          },
        ),
        SwitchListTile.adaptive(
          title: const Text('Loan EMI Due Dates'),
          value: false,
          onChanged: (value) {
            // Handle toggle
          },
        ),
        SwitchListTile.adaptive(
          title: const Text('Group Announcements'),
          value: false,
          onChanged: (value) {
            // Handle toggle
          },
        ),
      ],
    );
  }

  Widget _buildGroupManagementSection() {
    return _buildCustomExpansionTile(
      title: 'Group Management',
      children: [
        ListTile(
          title: const Text('View/Edit Details'),
          onTap: () {
            // Navigate to group details
          },
        ),
        ListTile(
          title: const Text('Change Member Roles'),
          onTap: () {
            // Navigate to change roles
          },
        ),
      ],
    );
  }

  Widget _buildLanguageRegionalSection() {
    return _buildCustomExpansionTile(
      title: 'Language & Regional Settings',
      children: [
        ListTile(
          title: const Text('Language'),
          trailing: DropdownButton<String>(
            value: 'English',
            items: ['English', 'Hindi', 'Marathi']
                .map((lang) => DropdownMenuItem(
                      value: lang,
                      child: Text(lang),
                    ))
                .toList(),
            onChanged: (value) {
              // Handle language change
            },
          ),
        ),
        ListTile(
          title: const Text('Regional Settings'),
          onTap: () {
            // Navigate to regional settings
          },
        ),
      ],
    );
  }

  Widget _buildHelpSupportSection() {
    return _buildCustomExpansionTile(
      title: 'Help & Support',
      children: [
        ListTile(
          title: const Text('Contact Support'),
          onTap: () {
            // Navigate to contact support
          },
        ),
        ListTile(
          title: const Text('FAQ Section'),
          onTap: () {
            // Navigate to FAQ
          },
        ),
        ListTile(
          title: const Text('Tutorials'),
          onTap: () {
            // Navigate to tutorials
          },
        ),
      ],
    );
  }

  Widget _buildFeedbackAboutSection() {
    return _buildCustomExpansionTile(
      title: 'Feedback & About',
      children: [
        ListTile(
          title: const Text('Feedback & Community'),
          onTap: () {
            // Navigate to feedback
          },
        ),
        ListTile(
          title: const Text('Terms, Privacy'),
          onTap: () {
            // Navigate to terms and privacy
          },
        ),
        ListTile(
          title: const Text('More About'),
          onTap: () {
            // Navigate to about us
          },
        ),
      ],
    );
  }

  Widget _buildLogoutSection() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        title: const Text(
          'Logout',
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
        onTap: () {
          // Confirm logout
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Logout'),
              content: const Text('Are you sure you want to logout?'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/login', (route) => false);
                  },
                  child: const Text('Logout'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildCustomExpansionTile({
    required String title,
    required List<Widget> children,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        trailing: const SizedBox(), // Hide dropdown icon
        children: children,
      ),
    );
  }
}
