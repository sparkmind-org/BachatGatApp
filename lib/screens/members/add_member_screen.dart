import 'package:flutter/material.dart';
import '../../widgets/custom_footer.dart';

class AddMemberScreen extends StatefulWidget {
  const AddMemberScreen({Key? key}) : super(key: key);

  @override
   _AddMembersScreenState createState() => _AddMembersScreenState();
}

class _AddMembersScreenState extends State<AddMemberScreen> {
 int _selectedIndex = 0;

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/home');
        break;
      case 1:
        Navigator.pushNamed(context, '/members');
        break;
      case 2:
        Navigator.pushNamed(context, '/add-member');
        break;
      case 3:
        Navigator.pushNamed(context, '/reports');
        break;
      case 4:
        Navigator.pushNamed(context, '/menu');
        break;
    }
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Member'),
      ),
      body: Center(
        child: Text('Add Member Screen', style: TextStyle(fontSize: 24)),
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