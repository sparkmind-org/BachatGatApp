import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../routes/route.dart';
import 'package:go_router/go_router.dart';
import '../../widgets/custom_footer.dart'; // Assuming CustomFooter is defined here

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key });

  @override
  NotificationsScreenState createState() => NotificationsScreenState();
}

class NotificationsScreenState extends State<NotificationsScreen> {
  int _selectedIndex = 3; // Active index for footer navigation
  String selectedFilter = "All";

  final List<Map<String, dynamic>> notifications = [
    {
      'title': 'EMI Payment Received',
      'description': 'Shri Vikas Bharti paid ₹5,000 for Loan #123',
      'icon': Icons.home,
      'time': '2 hours ago',
      'type': 'Today',
      'action': 'View Details',
    },
    {
      'title': 'Savings Added',
      'description': 'Shri Vikas Bharti added ₹2,000 to the group fund.',
      'icon': Icons.savings,
      'time': '10 hours ago',
      'type': 'Today',
      'action': null,
    },
  ];

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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          flexibleSpace: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                    ),
                    Stack(
                      children: [
                        IconButton(
                          icon: SvgPicture.asset(
                            'assets/icon/Bellicon.svg',
                            height: 24,
                            width: 24,
                          ),
                          onPressed: () {
                            // Bell icon action
                          },
                        ),
                        Positioned(
                          right: 0,
                          top: 0,
                          child: notifications.isNotEmpty
                              ? Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: const BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Text(
                                    '${notifications.length}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              : const SizedBox.shrink(),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Notifications',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Marked all notifications as read')),
                            );
                          },
                          child: const Text('Mark All as Read', style: TextStyle(color: Colors.black)),
                        ),
                        IconButton(
                          icon: const Icon(Icons.settings, color: Colors.black),
                          onPressed: () {
                            Navigator.pushNamed(context, '/settings');
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: notifications.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icon/Select.svg', // Replace with your 'Select' SVG file
                    height: 100,
                    width: 100,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "You're all caught up!",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "No new notifications to show.",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    child: const Text("Go to Home"),
                  ),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: ['All', 'Savings', 'Loans', 'Meetings', 'Alerts']
                          .map(
                            (filter) => Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: FilterChip(
                                label: Text(filter),
                                selected: selectedFilter == filter,
                                onSelected: (bool value) {
                                  setState(() {
                                    selectedFilter = filter;
                                  });
                                },
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: ListView.builder(
                      itemCount: notifications.length,
                      itemBuilder: (context, index) {
                        final notification = notifications[index];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (index == 0 || notifications[index - 1]['type'] != notification['type'])
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                  notification['type']!,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            Card(
                              margin: const EdgeInsets.symmetric(vertical: 4.0),
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.blue,
                                  child: Icon(notification['icon'], color: Colors.white),
                                ),
                                title: Text(notification['title']!),
                                subtitle: Text('${notification['description']}\n${notification['time']}'),
                                trailing: IconButton(
                                  icon: const Icon(Icons.more_vert),
                                  onPressed: () {
                                    // Popup menu action
                                  },
                                ),
                                isThreeLine: true,
                              ),
                            ),
                          ],
                        );
                      },
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
}