import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/auth_view_model.dart';
import '../home/home_screen.dart';
import 'components/login_button.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authViewModel = ref.watch(authViewModelProvider);

    // 로그인 상태에 따라 화면 이동
    if (authViewModel.currentUser != null) {
      return const HomeScreen();
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'ShareSphere에 오신 것을 환영합니다!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),
            LoginButton(
              text: '구글로 로그인',
              icon: Icons.g_mobiledata,
              color: Colors.white,
              textColor: Colors.black,
              onPressed: () async {
                await authViewModel.signInWithGoogle();
              },
            ),
            const SizedBox(height: 16),
            LoginButton(
              text: '카카오로 로그인',
              icon: Icons.chat_bubble,
              color: Colors.yellow,
              textColor: Colors.black,
              onPressed: () async {
                await authViewModel.signInWithKakao();
              },
            ),
            if (authViewModel.errorMessage != null) ...[
              const SizedBox(height: 16),
              Text(
                authViewModel.errorMessage!,
                style: const TextStyle(color: Colors.red),
              ),
            ],
          ],
        ),
      ),
    );
  }
}