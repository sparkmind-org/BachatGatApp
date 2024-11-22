import 'package:flutter/material.dart';
import '../../../widgets/custom_footer.dart';
import '../../../../routes/router.dart';
import 'package:go_router/go_router.dart';

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
      appBar: AppBar(
        title: const Text('Balance Sheet of Bachat Gat'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        titleTextStyle: const TextStyle(color: Colors.black, fontSize: 20),
        iconTheme: const IconThemeData(color: Colors.black),
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
