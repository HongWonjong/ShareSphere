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
    final isSelected = viewModel.selectedCategory == title;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 4), // 간격 최소화
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue.shade600 : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () {
          viewModel.selectCategory(title);
        },
        borderRadius: BorderRadius.circular(8),
        child: Container(
          width: 120, // 고정 너비
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            children: [
              Icon(
                icon,
                color: isSelected ? Colors.white : theme.colorScheme.primary,
                size: 24, // 고정 크기
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: isSelected ? Colors.white : theme.colorScheme.onSurface,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}