import 'package:flutter/material.dart';
import '../../../widgets/custom_footer.dart';

class AddDividendRepayScreen extends StatefulWidget {
  const AddDividendRepayScreen({Key? key}) : super(key: key);

  @override
  _AddDividendRepayScreenState createState() => _AddDividendRepayScreenState();
}

class _AddDividendRepayScreenState extends State<AddDividendRepayScreen> {
  int _selectedIndex = 2;

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
        title: const Text('Add Dividend/Repay'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        titleTextStyle: const TextStyle(color: Colors.black, fontSize: 20),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: const Center(
        child: Text(
          'Add Dividend/Repay Screen Content Here',
          style: TextStyle(fontSize: 16),
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
}
