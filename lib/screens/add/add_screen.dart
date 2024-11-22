import 'package:flutter/material.dart';
import '../../widgets/custom_footer.dart';
import '../../widgets/custom_app_bar.dart';
import '../../routes/router.dart';
import 'package:go_router/go_router.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  AddScreenState createState() => AddScreenState();
}

class AddScreenState extends State<AddScreen> {
  int _selectedIndex = 2; // Set to 2 since this is the 'Add' screen

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
        title: 'Add',
        showBackButton: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Wrap(
          spacing: 12, // Space between cards horizontally
          runSpacing: 12, // Space between cards vertically
          children: [
            _buildAddCard('Add Saving Collection', Icons.savings, Routes.addSaving),
            _buildAddCard('Add Loan Installment/EMI', Icons.attach_money, Routes.addLoanEmi),
            _buildAddCard('Add Fine Collection', Icons.gavel, Routes.addFine),
            _buildAddCard('Issue New Loan', Icons.new_releases, Routes.issueLoan),
            _buildAddCard('Add Income/Expense', Icons.receipt, Routes.addIncomeExpense),
            _buildAddCard('Add Dividend/Repay', Icons.payments, Routes.addDividend),
            _buildAddCard('Add New Member', Icons.person_add, Routes.addMember),
            _buildAddCard('Create/Schedule Meeting', Icons.event, Routes.addMeeting),
            _buildAddCard(
                'Add Bank Details/Statements', Icons.account_balance_wallet, Routes.addBankDetails),
            _buildAddCard('Issue Notice', Icons.notifications_active, Routes.issueNotice),
          ],
        ),
      ),
      bottomNavigationBar: CustomFooter(
        currentIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }

  Widget _buildAddCard(String title, IconData iconData, String route) {
    return GestureDetector(
      onTap: () => context.go(route), // Updated to use GoRouter
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 3 - 24, // Adjusted for three cards per row
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(iconData, size: 30, color: Colors.grey[700]),
                const SizedBox(height: 8),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}