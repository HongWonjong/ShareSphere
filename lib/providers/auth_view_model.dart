import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user_model.dart';
import '../repositories/auth_repository.dart';

// Riverpod Provider
final authViewModelProvider = ChangeNotifierProvider((ref) => AuthViewModel(ref.read(authRepositoryProvider)));
final authRepositoryProvider = Provider((ref) => AuthRepository());

class AuthViewModel extends ChangeNotifier {
  final AuthRepository _authRepository;
  UserModel? _currentUser;
  String? _errorMessage;

  AuthViewModel(this._authRepository) {
    _currentUser = _authRepository.getCurrentUser();
  }

  UserModel? get currentUser => _currentUser;
  String? get errorMessage => _errorMessage;

  Future<void> signInWithGoogle() async {
    try {
      _errorMessage = null;
      _currentUser = await _authRepository.signInWithGoogle();
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
    }
  }

  Future<void> signInWithKakao() async {
    try {
      _errorMessage = null;
      _currentUser = await _authRepository.signInWithKakao();
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
    }
  }

  Future<void> signOut() async {
    await _authRepository.signOut();
    _currentUser = null;
    notifyListeners();
  }
}