import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../providers/file_view_model.dart';

class SidebarItem extends ConsumerWidget {
  final String title;
  final IconData icon;

  const SidebarItem({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(fileViewModelProvider);
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final isSelected = viewModel.selectedCategory == title;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 2, horizontal: screenWidth * 0.01),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue.shade600 : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
        leading: Icon(
          icon,
          color: isSelected ? Colors.white : theme.colorScheme.primary,
          size: screenWidth * 0.025,
        ),
        title: Text(
          title,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: isSelected ? Colors.white : theme.colorScheme.onSurface,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        onTap: () {
          viewModel.selectCategory(title);
        },
        hoverColor: theme.colorScheme.surfaceContainerHighest.withOpacity(0.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}