import 'package:flutter/material.dart';
import '../../../models/file_item.dart';

void showFileDetailsDialog(BuildContext context, FileItem file) {
  showDialog(
    context: context,
    builder: (context) {
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
}