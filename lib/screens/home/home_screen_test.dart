import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../widgets/custom_footer.dart';
import '../../widgets/custom_app_bar.dart';
import '../../routes/router.dart';
import 'widgets/group_overview.dart';
import 'widgets/insights_view.dart';
import 'widgets/tab_toggle.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int _currentTabIndex = 0;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F5FD),
      appBar: const CustomAppBar(
        title: 'Bachat Gat',
        showBackButton: false,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TabToggle(
              currentIndex: _currentTabIndex,
              onTabChanged: (index) => setState(() => _currentTabIndex = index),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: _currentTabIndex == 0
                  ? const GroupOverview()
                  : const InsightsView(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomFooter(
        currentIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}