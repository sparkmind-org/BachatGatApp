import 'package:flutter/material.dart';
import '../../../widgets/custom_footer.dart';
import '../../../../routes/route.dart';
import 'package:go_router/go_router.dart';
import '../../../widgets/custom_app_bar.dart';


class LoanDistributionScreen extends StatefulWidget {
  const LoanDistributionScreen({super.key});

  @override
  LoanDistributionScreenState createState() => LoanDistributionScreenState();
}

class LoanDistributionScreenState extends State<LoanDistributionScreen> {
  int _selectedIndex = 3; // Assuming 'Reports' is the 4th item in the footer

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
        title: 'Loan Distribution Report',
        showBackButton: true,
      ),
      body: const Center(
        child: Text(
          'Loan Distribution Report Content Here',
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