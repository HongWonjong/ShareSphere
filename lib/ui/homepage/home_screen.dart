import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/file_item.dart';
import '../../../providers/file_view_model.dart';
import 'components/header_button.dart';
import 'components/sidebar_item.dart';
import 'components/file_details_dialog.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(fileViewModelProvider);
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          // 헤더
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [theme.colorScheme.primary, theme.colorScheme.secondary],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'ShareSphere',
                  style: theme.textTheme.headlineSmall?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    HeaderButton(label: 'Top100'),
                    HeaderButton(label: '드라마'),
                    HeaderButton(label: '영화'),
                  ],
                ),
              ],
            ),
          ),
          // 상단 메뉴 (가로 스크롤)
          Container(
            height: 60, // 고정 높이
            color: theme.colorScheme.surfaceContainerLow,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SidebarItem(title: '영화', icon: Icons.movie),
                  SidebarItem(title: '드라마', icon: Icons.tv),
                  SidebarItem(title: '음악', icon: Icons.music_note),
                  SidebarItem(title: '게임', icon: Icons.videogame_asset),
                  SidebarItem(title: '소프트웨어', icon: Icons.code),
                  SidebarItem(title: '문서', icon: Icons.description),
                  SidebarItem(title: '이미지', icon: Icons.image),
                  SidebarItem(title: '만화', icon: Icons.book),
                  SidebarItem(title: '애니', icon: Icons.animation),
                  SidebarItem(title: '스트리밍', icon: Icons.stream),
                ],
              ),
            ),
          ),
          // 메인 콘텐츠
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: viewModel.currentFiles.length,
                      itemBuilder: (context, index) {
                        final file = viewModel.currentFiles[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          child: ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            title: Text(
                              file.title,
                              style: theme.textTheme.titleMedium,
                              overflow: TextOverflow.ellipsis,
                            ),
                            subtitle: Row(
                              children: [
                                Text(file.size, style: theme.textTheme.bodySmall),
                                const SizedBox(width: 8),
                                Text(file.uploader, style: theme.textTheme.bodySmall),
                              ],
                            ),
                            onTap: () {
                              showFileDetailsDialog(context, file);
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  // 페이지 네비게이션
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_back),
                          color: theme.colorScheme.primary,
                        ),
                        Text(
                          '1 2 3 4 5',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontSize: (theme.textTheme.bodyMedium?.fontSize ?? 14) * 1.5, // 숫자 크기 1.5배
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_forward),
                          color: theme.colorScheme.primary,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}