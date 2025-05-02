import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../providers/auth_view_model.dart';
import 'header_button.dart';

class CustomAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final VoidCallback onLoginPressed;
  final bool showBackButton;
  final bool hideLoginButton;

  const CustomAppBar({
    super.key,
    required this.onLoginPressed,
    this.showBackButton = false,
    this.hideLoginButton = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authViewModel = ref.watch(authViewModelProvider);
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [theme.colorScheme.primary, theme.colorScheme.secondary],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                if (showBackButton)
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    tooltip: '뒤로 가기',
                  ),
                SizedBox(width: 10,),
                Text(
                  'ShareSphere',
                  style: theme.textTheme.headlineSmall?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                HeaderButton(label: '영화'),
                HeaderButton(label: '드라마'),
                if (!hideLoginButton) ...[
                  const SizedBox(width: 8),
                  IconButton(
                    onPressed: onLoginPressed,
                    icon: Icon(
                      authViewModel.currentUser != null
                          ? Icons.logout
                          : Icons.login,
                      color: Colors.white,
                    ),
                    tooltip: authViewModel.currentUser != null ? '로그아웃' : '로그인',
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 12);
}