import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart' as kakao;
import '../models/user_model.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // 현재 로그인된 사용자 가져오기
  UserModel? getCurrentUser() {
    final user = _firebaseAuth.currentUser;
    if (user != null) {
      return UserModel(
        uid: user.uid,
        displayName: user.displayName ?? 'Unknown',
        email: user.email ?? '',
        photoUrl: user.photoURL,
      );
    }
    return null;
  }

  // 구글 로그인
  Future<UserModel?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null; // 로그인 취소

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential = await _firebaseAuth.signInWithCredential(credential);
      final user = userCredential.user;
      if (user != null) {
        return UserModel(
          uid: user.uid,
          displayName: user.displayName ?? 'Unknown',
          email: user.email ?? '',
          photoUrl: user.photoURL,
        );
      }
      return null;
    } catch (e) {
      throw Exception('구글 로그인 실패: $e');
    }
  }

  // 카카오 로그인
  Future<UserModel?> signInWithKakao() async {
    try {
      kakao.OAuthToken token;
      if (await kakao.isKakaoTalkInstalled()) {
        token = await kakao.UserApi.instance.loginWithKakaoTalk();
      } else {
        token = await kakao.UserApi.instance.loginWithKakaoAccount();
      }

      final credential = OAuthProvider('oidc.kakao').credential(
        idToken: token.idToken,
      );

      final userCredential = await _firebaseAuth.signInWithCredential(credential);
      final user = userCredential.user;
      if (user != null) {
        return UserModel(
          uid: user.uid,
          displayName: user.displayName ?? 'Unknown',
          email: user.email ?? '',
          photoUrl: user.photoURL,
        );
      }
      return null;
    } catch (e) {
      throw Exception('카카오 로그인 실패: $e');
    }
  }

  // 로그아웃
  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await kakao.UserApi.instance.unlink();
    await _firebaseAuth.signOut();
  }
}