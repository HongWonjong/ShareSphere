import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/file_item.dart';
import '../repositories/file_repository.dart';

// Riverpod Provider
final fileViewModelProvider = ChangeNotifierProvider((ref) => FileViewModel(FileRepository()));

class FileViewModel extends ChangeNotifier {
  final FileRepository _repository;
  late final Map<String, List<FileItem>> _categoryFiles;
  bool _isSidebarOpen = true;
  String _selectedCategory = '영화'; // 기본 선택 카테고리

  FileViewModel(this._repository) {
    _categoryFiles = _repository.getCategoryFiles();
  }

  bool get isSidebarOpen => _isSidebarOpen;
  String get selectedCategory => _selectedCategory;
  List<FileItem> get currentFiles => _categoryFiles[_selectedCategory] ?? [];

  void selectCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }

  void toggleSidebar() {
    _isSidebarOpen = !_isSidebarOpen;
    notifyListeners();
  }
}