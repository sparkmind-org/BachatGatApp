import 'package:flutter/material.dart';
import '../../widgets/custom_footer.dart';
import '../../routes/route_generator.dart'; // Import RouteGenerator for route constants

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  AddScreenState createState() => AddScreenState();
}

class AddScreenState extends State<AddScreen> {
  int _selectedIndex = 2; // Set to 2 since this is the 'Add' screen

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        Navigator.pushNamed(context, RouteGenerator.home);
        break;
      case 1:
        Navigator.pushNamed(context, RouteGenerator.members);
        break;
      case 2:
        Navigator.pushNamed(context, RouteGenerator.add);
        break;
      case 3:
        Navigator.pushNamed(context, RouteGenerator.reports);
        break;
      case 4:
        Navigator.pushNamed(context, RouteGenerator.menu);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add'),
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black),
        titleTextStyle: const TextStyle(color: Colors.black, fontSize: 20),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Wrap(
          spacing: 12, // Space between cards horizontally
          runSpacing: 12, // Space between cards vertically
          children: [
            _buildAddCard('Add Saving Collection', Icons.savings, RouteGenerator.addSaving),
            _buildAddCard('Add Loan Installment/EMI', Icons.attach_money, RouteGenerator.addLoanEmi),
            _buildAddCard('Add Fine Collection', Icons.gavel, RouteGenerator.addFine),
            _buildAddCard('Issue New Loan', Icons.new_releases, RouteGenerator.issueLoan),
            _buildAddCard('Add Income/Expense', Icons.receipt, RouteGenerator.addIncomeExpense),
            _buildAddCard('Add Dividend/Repay', Icons.payments, RouteGenerator.addDividend),
            _buildAddCard('Add New Member', Icons.person_add, RouteGenerator.addMember),
            _buildAddCard('Create/Schedule Meeting', Icons.event, RouteGenerator.addMeeting),
            _buildAddCard(
                'Add Bank Details/Statements', Icons.account_balance_wallet, RouteGenerator.addBankDetails),
            _buildAddCard('Issue Notice', Icons.notifications_active, RouteGenerator.issueNotice),
          ],
        ),
      ),
      bottomNavigationBar: CustomFooter(
        currentIndex: _selectedIndex,
        onItemTapped: (index) {
          setState(() {
            _selectedIndex = index;
          });
          _onItemTapped(index);
        },
      ),
    );
  }

  Widget _buildAddCard(String title, IconData iconData, String route) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
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
                  overflow: TextOverflow.ellipsis, // Adds ellipsis for overflow
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
