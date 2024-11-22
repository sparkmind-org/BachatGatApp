import 'package:flutter/material.dart';
import '../../../widgets/custom_footer.dart';
import '../../../../routes/router.dart';
import 'package:go_router/go_router.dart';
import '../../../widgets/custom_app_bar.dart';


class AddDividendRepayScreen extends StatefulWidget {
  const AddDividendRepayScreen({super.key});

  @override
  AddDividendRepayScreenState createState() => AddDividendRepayScreenState();
}

class AddDividendRepayScreenState extends State<AddDividendRepayScreen> {
  int _selectedIndex = 2;

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
        title: 'Add Dividend/Repay',
        showBackButton: true,
      ),
      body: const Center(
        child: Text(
          'Add Dividend/Repay Screen Content Here',
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
