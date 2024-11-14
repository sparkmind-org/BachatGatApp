import 'package:flutter/material.dart';
import '../../widgets/custom_footer.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({Key? key}) : super(key: key);

  @override
  _ReportsScreenState createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  int _selectedIndex = 3; // Assuming 'Reports' is the 4th item in the footer

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/home');
        break;
      case 1:
        Navigator.pushNamed(context, '/members');
        break;
      case 2:
        Navigator.pushNamed(context, '/add');
        break;
      case 3:
        Navigator.pushNamed(context, '/reports');
        break;
      case 4:
        Navigator.pushNamed(context, '/menu');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reports'),
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
            _buildReportCard('Loan Distribution report', Icons.attach_money),
            _buildReportCard('Pending Saving Emi', Icons.savings),
            _buildReportCard('Pending Loan Emi', Icons.pending_actions),
            _buildReportCard('Other Expenses Report', Icons.receipt),
            _buildReportCard('Other Income Report', Icons.trending_up),
            _buildReportCard('Balance Sheet of Bachat Gat', Icons.pie_chart),
            _buildReportCard('Balance Sheet of Members', Icons.people_alt),
            _buildReportCard(
                'Loan requirement and Risk validation Report', Icons.assessment),
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

  Widget _buildReportCard(String title, IconData iconData) {
    return Container(
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
    );
  }
}
