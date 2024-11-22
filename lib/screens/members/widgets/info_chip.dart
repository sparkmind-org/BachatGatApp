import 'package:flutter/material.dart';
import 'info_dialog.dart';

class InfoChip extends StatelessWidget {
  final IconData icon;
  final String value;
  final Color color;
  final String tooltip;
  final String title;
  final String description;
  final List<String> details;

  const InfoChip({
    super.key,
    required this.icon,
    required this.value,
    required this.color,
    required this.tooltip,
    required this.title,
    required this.description,
    required this.details,
  });

  void _showInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => InfoDialog(
        icon: icon,
        title: title,
        value: value,
        color: color,
        description: description,
        details: details,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _showInfoDialog(context),
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: color.withOpacity(0.2),
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 12, color: color),
            const SizedBox(width: 4),
            Text(
              value,
              style: TextStyle(
                color: color,
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}