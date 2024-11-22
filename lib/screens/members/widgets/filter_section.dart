import 'package:flutter/material.dart';

class FilterSection extends StatelessWidget {
  final String selectedFilter;
  final Function(String) onFilterChanged;

  const FilterSection({
    super.key,
    required this.selectedFilter,
    required this.onFilterChanged,
  });

  Widget _buildFilterChip(String label, IconData icon) {
    bool isSelected = selectedFilter == label;
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: FilterChip(
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 16,
              color: isSelected ? Colors.white : Colors.blue,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.blue,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        selected: isSelected,
        onSelected: (bool value) => onFilterChanged(label),
        backgroundColor: Colors.white,
        selectedColor: Colors.blue,
        checkmarkColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            color: isSelected ? Colors.blue : Colors.blue.withOpacity(0.3),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildFilterChip("All", Icons.group),
          _buildFilterChip("Highest Loan", Icons.trending_up),
          _buildFilterChip("Top Savers", Icons.savings),
          _buildFilterChip("Defaulters", Icons.warning),
        ],
      ),
    );
  }
}