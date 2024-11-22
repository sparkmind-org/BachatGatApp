import 'package:flutter/material.dart';
import '../../../widgets/custom_footer.dart';
import '../../../../routes/router.dart';
import 'package:go_router/go_router.dart';

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
      appBar: AppBar(
        title: const Text('Pending Loan EMI'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        titleTextStyle: const TextStyle(color: Colors.black, fontSize: 20),
        iconTheme: const IconThemeData(color: Colors.black),
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
