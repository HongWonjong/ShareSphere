import 'package:flutter/material.dart';

class CustomFilterChip extends StatelessWidget {
  final String label;
  final IconData icon;

  const CustomFilterChip({super.key, required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.of(context).size.width;
    return FilterChip(
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: screenWidth * 0.015),
          const SizedBox(width: 4),
          Text(label),
        ],
      ),
      onSelected: (selected) {},
      selected: false,
      showCheckmark: false,
      side: BorderSide(color: theme.colorScheme.primary),
      elevation: 2,
    );
  }
}