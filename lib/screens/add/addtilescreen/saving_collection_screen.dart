import 'package:flutter/material.dart';
import '../../../widgets/custom_footer.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../../routes/route.dart';
import 'package:go_router/go_router.dart';


class AddSavingCollectionScreen extends StatefulWidget {
  const AddSavingCollectionScreen({super.key});

  @override
  AddSavingCollectionScreenState createState() => AddSavingCollectionScreenState();
}

class AddSavingCollectionScreenState extends State<AddSavingCollectionScreen> {
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
        title: 'Add Saving collection',
        showBackButton: true,
      ),
      body: const Center(
        child: Text(
          'Add Saving Collection Screen Content Here',
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