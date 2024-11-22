import 'package:flutter/material.dart';
import 'list_tab.dart';
import '../models/transaction_item.dart';

class ListSection extends StatefulWidget {
  const ListSection({super.key});

  @override
  State<ListSection> createState() => _ListSectionState();
}

class _ListSectionState extends State<ListSection> {
  int _currentListIndex = 0;
  final ScrollController _scrollController = ScrollController();

  final Map<int, List<TransactionItem>> _listData = {
    0: [ // Defaulters
      TransactionItem('Pratham Babre', '- ₹10,944.00', '10 Oct 2024'),
      TransactionItem('Balu Babre', '- ₹8,844.00', '18 Sep 2024'),
    ],
    1: [ // Contributors
      TransactionItem('John Doe', '+ ₹5,000.00', '15 Nov 2024'),
    ],
    2: [ // Pending Saving EMI
      TransactionItem('User A', '- ₹3,000.00', 'Pending'),
    ],
    3: [ // Pending Loan EMI
      TransactionItem('User X', '- ₹15,000.00', 'Pending'),
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 48,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ListView(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              children: [
                ListTab(
                  index: 0,
                  label: 'Defaulters',
                  isSelected: _currentListIndex == 0,
                  onTap: () => _updateTab(0),
                ),
                ListTab(
                  index: 1,
                  label: 'Contributors',
                  isSelected: _currentListIndex == 1,
                  onTap: () => _updateTab(1),
                ),
                ListTab(
                  index: 2,
                  label: 'Pending Saving EMI',
                  isSelected: _currentListIndex == 2,
                  onTap: () => _updateTab(2),
                ),
                ListTab(
                  index: 3,
                  label: 'Pending Loan EMI',
                  isSelected: _currentListIndex == 3,
                  onTap: () => _updateTab(3),
                ),
              ],
            ),
          ),
          const Divider(height: 1, thickness: 1),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: _buildListContent(),
          ),
        ],
      ),
    );
  }

  void _updateTab(int index) {
    setState(() => _currentListIndex = index);
  }

  Widget _buildListContent() {
    final items = _listData[_currentListIndex] ?? [];
    
    if (items.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Text(
            'No data available',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
          ),
        ),
      );
    }

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      separatorBuilder: (context, index) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final item = items[index];
        return ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          title: Text(
            item.name,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          subtitle: Text(
            item.date,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14,
            ),
          ),
          trailing: Text(
            item.amount,
            style: TextStyle(
              color: item.amount.contains('-') ? Colors.red : Colors.green,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}