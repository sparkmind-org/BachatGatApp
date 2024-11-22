import 'package:flutter/material.dart';
import '../../widgets/custom_footer.dart';
import '../../widgets/custom_app_bar.dart';
import 'models/member.dart';
import 'widgets/member_card/member_card.dart';
import 'widgets/search_bar.dart';
import 'widgets/filter_section.dart';
import 'package:go_router/go_router.dart';
import '../../routes/router.dart';

class MembersListScreen extends StatefulWidget {
  const MembersListScreen({super.key});

  @override
  MembersListScreenState createState() => MembersListScreenState();
}

class MembersListScreenState extends State<MembersListScreen> {
  int _selectedIndex = 1;
  String selectedFilter = "All";
  String searchQuery = "";

  final List<Member> members = [
    Member(
      name: 'Pratham Babre',
      creditScore: '700',
      role: 'Student',
      savings: '2000',
      loan: '500',
      mobile: '1234567890',
      profileImage: 'assets/02.jpg',
    ),
    Member(
      name: 'Kishore',
      creditScore: '750',
      role: 'Businessman',
      savings: '5000',
      loan: '1000',
      mobile: '1234567890',
      profileImage: 'assets/01.jpg',
    ),
    Member(
      name: 'Rahul',
      creditScore: '720',
      role: 'Engineer',
      savings: '3000',
      loan: '700',
      mobile: '1234567890',
      profileImage: 'assets/03.jpg',
    ),
    Member(
      name: 'Balu',
      creditScore: '680',
      role: 'Teacher',
      savings: '1500',
      loan: '400',
      mobile: '1234567890',
      profileImage: 'assets/04.jpg',
    )
  ];

  List<Member> get filteredMembers {
    return members.where((member) {
      if (!member.name.toLowerCase().contains(searchQuery.toLowerCase())) {
        return false;
      }

      switch (selectedFilter) {
        case "Highest Loan":
          return double.parse(member.loan) >= 1000;
        case "Top Savers":
          return double.parse(member.savings) >= 3000;
        case "Defaulters":
          return int.parse(member.creditScore) < 650;
        default:
          return true;
      }
    }).toList();
  }

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
    final routes = [Routes.home, Routes.members, Routes.add, Routes.reports, Routes.menu];
    if (index >= 0 && index < routes.length) {
      context.go(routes[index]);
    }
  }

  void _onSearchChanged(String query) {
    setState(() => searchQuery = query);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: const CustomAppBar(
        title: 'Members',
        showBackButton: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  CustomSearchBar(
                    onChanged: _onSearchChanged,
                  ),
                  const SizedBox(height: 16),
                  FilterSection(
                    selectedFilter: selectedFilter,
                    onFilterChanged: (filter) => setState(() => selectedFilter = filter),
                  ),
                ],
              ),
            ),
            Expanded(
              child: filteredMembers.isEmpty
                ? const Center(
                    child: Text(
                      'No members found',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: filteredMembers.length,
                    itemBuilder: (context, index) => MemberCard(
                      member: filteredMembers[index],
                      onEdit: () => _showMessage('Edit Member: ${filteredMembers[index].name}'),
                      onViewDetails: () => _showMessage('View Details: ${filteredMembers[index].name}'),
                    ),
                  ),
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

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
}