import 'package:flutter/material.dart';
import '../../../widgets/custom_footer.dart';
import '../../../../routes/route.dart';
import 'package:go_router/go_router.dart';
import '../../../widgets/custom_app_bar.dart';


class BalanceSheetBachatScreen extends StatefulWidget {
  const BalanceSheetBachatScreen({super.key});

  @override
  BalanceSheetBachatScreenState createState() => BalanceSheetBachatScreenState();
}

class BalanceSheetBachatScreenState extends State<BalanceSheetBachatScreen> {
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
        title: 'Balance Sheet of Bachat Gat',
        showBackButton: true,
      ),
      body: const Center(
        child: Text(
          'Balance Sheet of Bachat Gat Content Here',
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