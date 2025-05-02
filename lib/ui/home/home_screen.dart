import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/file_item.dart';
import '../../../providers/file_view_model.dart';
import 'components/header_button.dart';
import 'components/sidebar_item.dart';
import 'components/filter_chip.dart';
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
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02, vertical: 12),
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
          Expanded(
            child: Row(
              children: [
                // 사이드바
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  width: viewModel.isSidebarOpen ? screenWidth * 0.2 : 0,
                  color: theme.colorScheme.surfaceContainerLow,
                  child: viewModel.isSidebarOpen
                      ? ListView(
                    children: [
                      SidebarItem(title: '영화', icon: Icons.movie),
                      SidebarItem(title: '드라마', icon: Icons.tv),
                      SidebarItem(title: '음악', icon: Icons.music_note),
                      SidebarItem(title: '게임', icon: Icons.videogame_asset),
                      SidebarItem(title: '소프트웨어', icon: Icons.code),
                      SidebarItem(title: '문서', icon: Icons.description),
                      SidebarItem(title: '이미지', icon: Icons.image),
                      SidebarItem(title: '만화', icon: Icons.book),
                      SidebarItem(title: '애니메이션', icon: Icons.animation),
                      SidebarItem(title: '스트리밍', icon: Icons.stream),
                    ],
                  )
                      : const SizedBox.shrink(),
                ),
                // 사이드바 토글 버튼
                Container(
                  width: screenWidth * 0.03,
                  color: theme.colorScheme.surfaceContainerLow,
                  child: IconButton(
                    icon: Icon(
                      viewModel.isSidebarOpen ? Icons.arrow_left : Icons.arrow_right,
                      color: theme.colorScheme.primary,
                    ),
                    onPressed: () {
                      viewModel.toggleSidebar();
                    },
                    tooltip: viewModel.isSidebarOpen ? '사이드바 접기' : '사이드바 펼치기',
                  ),
                ),
                // 메인 콘텐츠
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(screenWidth * 0.02),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 필터 버튼
                        Wrap(
                          spacing: 8,
                          children: [
                            CustomFilterChip(label: '하드', icon: Icons.storage),
                            CustomFilterChip(label: '게임', icon: Icons.games),
                            CustomFilterChip(label: '시리즈', icon: Icons.video_collection),
                          ],
                        ),
                        SizedBox(height: screenWidth * 0.02),
                        Expanded(
                          child: ListView.builder(
                            itemCount: viewModel.currentFiles.length,
                            itemBuilder: (context, index) {
                              final file = viewModel.currentFiles[index];
                              return Card(
                                margin: const EdgeInsets.symmetric(vertical: 4),
                                child: ListTile(
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: screenWidth * 0.02,
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
                                      SizedBox(width: screenWidth * 0.01),
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
                          padding: EdgeInsets.symmetric(vertical: screenWidth * 0.02),
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
                                style: theme.textTheme.bodyMedium,
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
                // 사이드 광고
                Container(
                  width: screenWidth * 0.15,
                  color: theme.colorScheme.surfaceContainer,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.campaign, size: screenWidth * 0.05, color: theme.colorScheme.primary),
                        Text('광고 영역', style: theme.textTheme.titleMedium),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}