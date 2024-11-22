import 'package:flutter/material.dart';
import 'overview_card.dart';
import 'list_section.dart';

class GroupOverview extends StatelessWidget {
  const GroupOverview({super.key});

  @override
  Widget build(BuildContext context) {
    final cardData = [
      {'title': 'Total Group Savings', 'value': '₹5,00,000.00', 'color': Colors.green},
      {'title': 'Current Bank Balance', 'value': '₹5,00,000.00', 'color': Colors.blue},
      {'title': 'Bachat Gat Loan/Subsidy', 'value': '₹5,00,000.00', 'color': Colors.orange},
      {'title': 'Total Penalties Collected', 'value': '₹10,000.00', 'color': Colors.red},
      {'title': 'Upcoming Loan Dues', 'value': '₹1,00,000.00', 'color': Colors.purple},
      {'title': 'Pending Contributions', 'value': '₹25,000.00', 'color': Colors.teal},
      {'title': 'Loan Repayment Percentage', 'value': '70%', 'color': Colors.redAccent},
    ];

    // Divide the cards into two rows for the horizontal scroll
    List<Widget> groupedCards = [];
    for (int i = 0; i < cardData.length; i += 2) {
      groupedCards.add(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCard(context, cardData[i]),
            if (i + 1 < cardData.length) const SizedBox(height: 16.0),
            if (i + 1 < cardData.length) _buildCard(context, cardData[i + 1]),
          ],
        ),
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Horizontally scrollable cards in two rows
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: groupedCards
                  .map(
                    (widget) => Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: widget,
                    ),
                  )
                  .toList(),
            ),
          ),
          const SizedBox(height: 24),
          // ListSection below the cards
          const ListSection(),
        ],
      ),
    );
  }

  Widget _buildCard(BuildContext context, Map<String, dynamic> data) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.4, // Adjust card width for responsiveness
      child: OverviewCard(
        title: data['title'] as String,
        value: data['value'] as String,
        color: data['color'] as Color,
      ),
    );
  }
}
