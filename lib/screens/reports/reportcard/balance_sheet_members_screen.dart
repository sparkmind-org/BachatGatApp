import 'package:flutter/material.dart';
import '../../../widgets/custom_footer.dart';
import '../../../../routes/route.dart';
import 'package:go_router/go_router.dart';
import '../../../widgets/custom_app_bar.dart';


class BalanceSheetMembersScreen extends StatefulWidget {
  const BalanceSheetMembersScreen({super.key});

  @override
  BalanceSheetMembersScreenState createState() => BalanceSheetMembersScreenState();
}

class BalanceSheetMembersScreenState extends State<BalanceSheetMembersScreen> {
  int _selectedIndex = 3;

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
      appBar: const CustomAppBar(
        title: 'Balance Sheet of Members',
        showBackButton: true,
      ),
      body: const Center(
        child: Text(
          'Balance Sheet of Members Content Here',
          style: TextStyle(fontSize: 16),
        ),
      ),
      bottomNavigationBar: CustomFooter(
        currentIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}