import 'package:flutter/material.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';
import '../../routes/route.dart';
import 'package:go_router/go_router.dart';
import '../../widgets/custom_footer.dart';
import '../../widgets/custom_app_bar.dart';


class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  int _selectedIndex = 4;

  // Toggle states for notifications
  bool _isPushNotificationsEnabled = true;
  bool _isEmailNotificationsEnabled = false;
  bool _isSavingsRemindersEnabled = false;
  bool _isLoanDueDatesEnabled = false;
  bool _isGroupAnnouncementsEnabled = false;

 void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
    final routes = [
      Routes.home,
      Routes.members,
      Routes.add,
      Routes.reports,
      Routes.menu,
    ];
    
    if (index >= 0 && index < routes.length) {
      context.go(routes[index]);
    }
  }

  Widget _buildProfileSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/01.jpg'),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Pratham Babre',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8),
                Text(
                  'Admin',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8),
                Text(
                  'prathambabre@gmail.com',
                  style: TextStyle(fontSize: 14),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8),
                Text(
                  '+91 900-812-9336',
                  style: TextStyle(fontSize: 14),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit, color: Colors.black),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Settings',
        showBackButton: false,
      ),
      body: SettingsList(
        platform: DevicePlatform.iOS,
        sections: [
          SettingsSection(
            title: const Text('Profile'),
            tiles: [
              CustomSettingsTile(
                child: _buildProfileSection(),
              ),
            ],
          ),
          _buildNotificationSection(),
          _buildGroupManagementSection(),
          _buildLanguageRegionalSection(),
          _buildHelpSupportSection(),
          _buildFeedbackAboutSection(),
          _buildLogoutSection(),
        ],
      ),
       bottomNavigationBar: CustomFooter(
        currentIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }

  SettingsSection _buildNotificationSection() {
    return SettingsSection(
      title: const Text('Notifications'),
      tiles: [
        SettingsTile.switchTile(
          leading: const Icon(Icons.notifications),
          title: const Text('Push Notifications'),
          initialValue: _isPushNotificationsEnabled,
          onToggle: (value) {
            setState(() {
              _isPushNotificationsEnabled = value;
            });
          },
        ),
        SettingsTile.switchTile(
          leading: const Icon(Icons.email),
          title: const Text('Email Notifications'),
          initialValue: _isEmailNotificationsEnabled,
          onToggle: (value) {
            setState(() {
              _isEmailNotificationsEnabled = value;
            });
          },
        ),
        SettingsTile.switchTile(
          leading: const Icon(Icons.savings),
          title: const Text('Savings Reminders'),
          initialValue: _isSavingsRemindersEnabled,
          onToggle: (value) {
            setState(() {
              _isSavingsRemindersEnabled = value;
            });
          },
        ),
        SettingsTile.switchTile(
          leading: const Icon(Icons.calendar_today),
          title: const Text('Loan EMI Due Dates'),
          initialValue: _isLoanDueDatesEnabled,
          onToggle: (value) {
            setState(() {
              _isLoanDueDatesEnabled = value;
            });
          },
        ),
        SettingsTile.switchTile(
          leading: const Icon(Icons.announcement),
          title: const Text('Group Announcements'),
          initialValue: _isGroupAnnouncementsEnabled,
          onToggle: (value) {
            setState(() {
              _isGroupAnnouncementsEnabled = value;
            });
          },
        ),
      ],
    );
  }

// Remaining sections remain unchanged.
}

SettingsSection _buildGroupManagementSection() {
  return SettingsSection(
    title: const Text('Group Management'),
    tiles: [
      SettingsTile.navigation(
        leading: const Icon(Icons.edit_note_sharp),
        title: const Text('View/Edit Details'),
        onPressed: (context) {
          Navigator.pushNamed(context, '/group-details');
        },
      ),
      SettingsTile.navigation(
        leading: const Icon(Icons.people_outline),
        title: const Text('Change Member Roles'),
        onPressed: (context) {
          Navigator.pushNamed(context, '/member-roles');
        },
      ),
    ],
  );
}

SettingsSection _buildLanguageRegionalSection() {
  return SettingsSection(

    title: const Text('Language & Regional Settings'),
    tiles: [
      SettingsTile.navigation(
        leading: const Icon(Icons.language),
        title: const Text('Language'),
        trailing: DropdownButton<String>(
          value: 'English',
          items: ['English', 'Hindi', 'Marathi']
              .map((lang) => DropdownMenuItem(value: lang, child: Text(lang)))
              .toList(),
          onChanged: (value) {},
        ),
      ),
      SettingsTile.navigation(
        leading: const Icon(Icons.location_on),
        title: const Text('Regional Settings'),
        onPressed: (context) {
        //  Navigator.pushNamed(context, '/regional-settings');
        },
      ),
    ],
  );
}

SettingsSection _buildHelpSupportSection() {
  return SettingsSection(
    title: const Text('Help & Support'),
    tiles: [
      SettingsTile.navigation(
        leading: const Icon(Icons.support),
        title: const Text('Contact Support'),
        onPressed: (context) {
          Navigator.pushNamed(context, '/support');
        },
      ),
      SettingsTile.navigation(
        leading: const Icon(Icons.question_answer),
        title: const Text('FAQ Section'),
        onPressed: (context) {
          Navigator.pushNamed(context, '/faq');
        },
      ),
      SettingsTile.navigation(
        leading: const Icon(Icons.play_circle_fill),
        title: const Text('Tutorials'),
        onPressed: (context) {
          Navigator.pushNamed(context, '/tutorials');
        },
      ),
    ],
  );
}

SettingsSection _buildFeedbackAboutSection() {
  return SettingsSection(
    title: const Text('Feedback & About'),
    tiles: [
      SettingsTile.navigation(
        leading: const Icon(Icons.feedback),
        title: const Text('Feedback & Community'),
        onPressed: (context) {
          Navigator.pushNamed(context, '/feedback');
        },
      ),
      SettingsTile.navigation(
        leading: const Icon(Icons.privacy_tip),
        title: const Text('Terms & Privacy'),
        onPressed: (context) {
          Navigator.pushNamed(context, '/terms-privacy');
        },
      ),
      SettingsTile.navigation(
        leading: const Icon(Icons.info),
        title: const Text('More About'),
        onPressed: (context) {
          Navigator.pushNamed(context, '/about');
        },
      ),
    ],
  );
}

SettingsSection _buildLogoutSection() {
  return SettingsSection(
    tiles: [
      SettingsTile.navigation(
        leading: const Icon(Icons.logout),
        title: const Text(
          'Logout',
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
        onPressed: (context) {
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
    ],
  );
}