import 'package:flutter/material.dart';
import '../../../widgets/custom_footer.dart';
import '../../../../routes/route.dart';
import 'package:go_router/go_router.dart';
import '../../../widgets/custom_app_bar.dart';


class PendingLoanEmiScreen extends StatefulWidget {
  const PendingLoanEmiScreen({super.key});

  @override
  PendingLoanEmiScreenState createState() => PendingLoanEmiScreenState();
}

class PendingLoanEmiScreenState extends State<PendingLoanEmiScreen> {
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
        title: 'Pending Loan EMI',
        showBackButton: true,
      ),
      body: const Center(
        child: Text(
          'Pending Loan EMI Content Here',
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