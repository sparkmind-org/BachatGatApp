import 'package:flutter/material.dart';
import '../../../widgets/custom_footer.dart';
import '../../../../routes/route.dart';
import 'package:go_router/go_router.dart';
import '../../../widgets/custom_app_bar.dart';


class LoanRiskValidationScreen extends StatefulWidget {
  const LoanRiskValidationScreen({super.key});

  @override
  LoanRiskValidationScreenState createState() =>
      LoanRiskValidationScreenState();
}

class LoanRiskValidationScreenState extends State<LoanRiskValidationScreen> {
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
        title: 'Loan & Risk Report',
        showBackButton: true,
      ),
      body: const Center(
        child: Text(
          'Loan Requirement & Risk Validation Report Content Here',
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