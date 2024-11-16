import 'package:flutter/material.dart';
import '../../widgets/custom_footer.dart';

class MembersListScreen extends StatefulWidget {
  const MembersListScreen({super.key});

  @override
  MembersListScreenState createState() => MembersListScreenState();
}

class MembersListScreenState extends State<MembersListScreen> {
  int _selectedIndex = 1;
  String selectedFilter = "All";

  // Static list of members with detailed data
  final List<Map<String, String>> members = [
    {
      'name': 'Pratham Babre',
      'creditScore': '700',
      'role': 'Student',
      'savings': '2000',
      'loan': '500',
      'Mobile': '1234567890',
      'ProfileImage': 'assets/02.jpg',
    },
    {
      'name': 'Kishore',
      'creditScore': '750',
      'role': 'Businessman',
      'savings': '5000',
      'loan': '1000',
      'Mobile': '1234567890',
      'ProfileImage': 'assets/01.jpg',
    },
    {
      'name': 'Rahul',
      'creditScore': '720',
      'role': 'Engineer',
      'savings': '3000',
      'loan': '700',
      'Mobile': '1234567890',
      'ProfileImage': 'assets/03.jpg',
    },
    {
      'name': 'Balu',
      'creditScore': '680',
      'role': 'Teacher',
      'savings': '1500',
      'loan': '400',
      'Mobile': '1234567890',
      'ProfileImage': 'assets/04.jpg',
    }
  ];

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

  void _showPopupMenu(BuildContext context, GlobalKey key, int index) {
    // Use the global key to get the position of the widget
    final RenderBox renderBox = key.currentContext?.findRenderObject() as RenderBox;
    final Offset offset = renderBox.localToGlobal(Offset.zero);

    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        offset.dx,
        offset.dy + 40, // Adjust popup position slightly below the three-dot icon
        MediaQuery.of(context).size.width - offset.dx,
        MediaQuery.of(context).size.height - offset.dy,
      ),
      items: [
        const PopupMenuItem<int>(
          value: 0,
          child: Row(
            children: [
              Icon(Icons.edit, color: Colors.black),
              SizedBox(width: 8),
              Text("Edit Member"),
            ],
          ),
        ),
        const PopupMenuItem<int>(
          value: 1,
          child: Row(
            children: [
              Icon(Icons.info, color: Colors.black),
              SizedBox(width: 8),
              Text("View Details"),
            ],
          ),
        ),
      ],
    ).then((value) {
      if (value == 0) {
        // Handle Edit Member
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Edit Member: ${members[index]['name']}')),
        );
      } else if (value == 1) {
        // Handle View Details
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('View Details: ${members[index]['name']}')),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Members'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Row(
                children: [
                  Icon(Icons.search, color: Colors.grey),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Members search',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Filter Chips
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  FilterChip(
                    label: const Text("All"),
                    selected: selectedFilter == "All",
                    onSelected: (bool value) {
                      setState(() {
                        selectedFilter = "All";
                      });
                    },
                  ),
                  const SizedBox(width: 8),
                  FilterChip(
                    label: const Text("Highest Loan Taker"),
                    selected: selectedFilter == "Highest Loan Taker",
                    onSelected: (bool value) {
                      setState(() {
                        selectedFilter = "Highest Loan Taker";
                      });
                    },
                  ),
                  const SizedBox(width: 8),
                  FilterChip(
                    label: const Text("Highest Saving Contributor"),
                    selected: selectedFilter == "Highest Saving Contributor",
                    onSelected: (bool value) {
                      setState(() {
                        selectedFilter = "Highest Saving Contributor";
                      });
                    },
                  ),
                  const SizedBox(width: 8),
                  FilterChip(
                    label: const Text("Defaulter"),
                    selected: selectedFilter == "Defaulter",
                    onSelected: (bool value) {
                      setState(() {
                        selectedFilter = "Defaulter";
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Member list
            Expanded(
              child: ListView.builder(
                itemCount: members.length,
                itemBuilder: (context, index) {
                  final member = members[index];
                  final GlobalKey iconKey = GlobalKey(); // Unique key for each IconButton
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(member['ProfileImage']!),
                      ),
                      title: Text(
                        member['name']!,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'Mobile: ${member['Mobile']}\n'
                        'Credit Score: ${member['creditScore']} | Role: ${member['role']}\n'
                        'Savings: \$${member['savings']} | Loan: \$${member['loan']}',
                      ),
                      trailing: IconButton(
                        key: iconKey,
                        icon: const Icon(Icons.more_vert),
                        onPressed: () {
                          _showPopupMenu(context, iconKey, index);
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
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
}
