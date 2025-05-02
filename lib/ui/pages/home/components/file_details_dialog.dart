import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../models/file_item.dart';
import '../../../../providers/auth_view_model.dart';
import '../../login/login_screen.dart';

void showFileDetailsDialog(BuildContext context, FileItem file) {
  showDialog(
    context: context,
    builder: (context) {
      return Consumer(
        builder: (context, ref, child) {
          final authViewModel = ref.watch(authViewModelProvider);
          final isLoggedIn = authViewModel.currentUser != null;

          return AlertDialog(
            title: Text(file.title),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('크기: ${file.size}'),
                Text('업로더: ${file.uploader}'),
                const SizedBox(height: 8),
                Text('설명: ${file.description}'),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: isLoggedIn
                      ? () {
                    // 다운로드 로직 (Firebase Storage 사용 예정)
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${file.title} 다운로드 시작')),
                    );
                    Navigator.of(context).pop();
                  }
                      : () {
                    // 로그인하지 않은 경우 로그인 화면으로 이동
                    Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginScreen()),
                    );
                  },
                  icon: const Icon(Icons.download),
                  label: const Text('다운로드'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isLoggedIn ? Colors.blue : Colors.grey,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('닫기'),
              ),
            ],
          );
        },
      );
    },
  );
}