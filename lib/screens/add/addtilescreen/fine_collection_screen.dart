import 'package:flutter/material.dart';
import '../../../widgets/custom_footer.dart';
import '../../../../routes/route.dart';
import 'package:go_router/go_router.dart';
import '../../../widgets/custom_app_bar.dart';


class AddFineCollectionScreen extends StatefulWidget {
  const AddFineCollectionScreen({super.key});

  @override
  AddFineCollectionScreenState createState() => AddFineCollectionScreenState();
}

class AddFineCollectionScreenState extends State<AddFineCollectionScreen> {
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
        title: 'Add Fine Collection',
        showBackButton: true,
      ),
      body: const Center(
        child: Text(
          'Add Fine Collection Screen Content Here',
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