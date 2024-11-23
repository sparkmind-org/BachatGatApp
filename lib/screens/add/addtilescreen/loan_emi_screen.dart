import 'package:flutter/material.dart';
import '../../../widgets/custom_footer.dart';
import '../../../../routes/route.dart';
import 'package:go_router/go_router.dart';
import '../../../widgets/custom_app_bar.dart';


class AddLoanEmiScreen extends StatefulWidget {
  const AddLoanEmiScreen({super.key});

  @override
  AddLoanEmiScreenState createState() => AddLoanEmiScreenState();
}

class AddLoanEmiScreenState extends State<AddLoanEmiScreen> {
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
        title: 'Add Loan Installment/EMI',
        showBackButton: true,
      ),
      body: const Center(
        child: Text(
          'Add Loan Installment/EMI Screen Content Here',
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