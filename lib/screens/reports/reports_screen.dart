import 'package:flutter/material.dart';
import '../../widgets/custom_footer.dart';
import '../../../../routes/route.dart';
import 'package:go_router/go_router.dart';
import '../../widgets/custom_app_bar.dart';


class ReportsScreen extends StatefulWidget {
  const ReportsScreen({super.key});

  @override
  ReportsScreenState createState() => ReportsScreenState();
}

class ReportsScreenState extends State<ReportsScreen> {
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
        title: 'Reports',
        showBackButton: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Wrap(
          spacing: 12, // Space between cards horizontally
          runSpacing: 12, // Space between cards vertically
          children: [
            _buildReportCard(
              'Loan Distribution Report',
              Icons.attach_money,
              Routes.loanDistribution,
            ),
            _buildReportCard(
              'Pending Saving EMI',
              Icons.savings,
              Routes.pendingSavingEmi,
            ),
            _buildReportCard(
              'Pending Loan EMI',
              Icons.pending_actions,
              Routes.pendingLoanEmi,
            ),
            _buildReportCard(
              'Other Expenses Report',
              Icons.receipt,
              Routes.otherExpenses,
            ),
            _buildReportCard(
              'Other Income Report',
              Icons.trending_up,
              Routes.otherIncome,
            ),
            _buildReportCard(
              'Balance Sheet of Bachat Gat',
              Icons.pie_chart,
              Routes.balanceSheetBachat,
            ),
            _buildReportCard(
              'Balance Sheet of Members',
              Icons.people_alt,
              Routes.balanceSheetMembers,
            ),
            _buildReportCard(
              'Loan Requirement & Risk Validation Report',
              Icons.assessment,
              Routes.loanRiskValidation,
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomFooter(
        currentIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }

  Widget _buildReportCard(String title, IconData iconData, String route) {
    return GestureDetector(
      onTap: () => context.push(route), // Updated to use GoRouter
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 3 - 24, // Three cards per row
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