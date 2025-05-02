ShareSphere - 파일 공유 플랫폼
ShareSphere는 사용자가 다양한 카테고리의 파일을 공유하고 탐색할 수 있는 Flutter 기반의 모바일 애플리케이션입니다. Firebase를 백엔드로 사용하며, 구글과 카카오 로그인을 통해 사용자 인증을 지원합니다. Riverpod와 MVVM 아키텍처를 활용하여 깔끔하고 유지보수 가능한 코드 구조를 제공합니다.
📋 프로젝트 개요
ShareSphere는 영화, 드라마, 음악, 게임, 소프트웨어 등 다양한 카테고리의 파일을 사용자들이 업로드하고 다운로드할 수 있는 플랫폼입니다. 모바일 환경에 최적화된 UI를 제공하며, 사용자는 간편한 로그인과 직관적인 인터페이스를 통해 파일을 쉽게 탐색할 수 있습니다.
주요 기능

사용자 인증: 구글과 카카오 로그인을 통해 간편하게 로그인 가능.
파일 탐색: 카테고리별로 파일을 분류하여 탐색 가능 (영화, 드라마, 음악, 게임 등).
가로 스크롤 메뉴: 상단에 위치한 가로 스크롤 가능한 카테고리 메뉴로 빠르게 원하는 카테고리로 이동.
파일 세부 정보: 파일 크기, 업로더, 설명 등을 확인 가능.
페이지 네비게이션: 파일 목록을 페이지 단위로 탐색 가능.
Firebase 통합: 사용자 데이터와 파일 메타데이터를 Firebase Firestore에 저장.
파일 업로드/다운로드: Firebase Storage를 통해 파일 업로드 및 다운로드 기능 제공 (구현 예정).

🛠️ 기술 스택

프론트엔드: Flutter (Dart)
상태 관리: Riverpod
아키텍처: MVVM (Model-View-ViewModel)
백엔드: Firebase
Firestore: 사용자 정보 및 파일 메타데이터 저장.
Storage: 파일 저장 및 다운로드.
Authentication: 구글 및 카카오 로그인 지원.


로그인: 구글 로그인 (google_sign_in), 카카오 로그인 (kakao_flutter_sdk).

📂 프로젝트 구조
lib/
├── main.dart                # 앱 진입점 및 Riverpod 초기화
├── models/                 # 데이터 모델
│   └── file_item.dart
├── repositories/           # 데이터 레포지토리
│   └── file_repository.dart
├── providers/              # Riverpod 상태 관리
│   └── file_view_model.dart
├── ui/                     # UI 관련 파일
│   ├── pages/             # 페이지
│   │   ├── home/
│   │   │   ├── home_screen.dart
│   │   │   └── components/ # 페이지 내 컴포넌트
│   │   │       ├── header_button.dart
│   │   │       ├── sidebar_item.dart
│   │   │       └── file_details_dialog.dart
│   └── app.dart           # 앱 테마 설정

🚀 설치 및 실행 방법
1. 사전 요구 사항

Flutter SDK 설치 (최신 버전 권장)
Firebase 프로젝트 설정
구글 및 카카오 개발자 콘솔에서 앱 등록 및 API 키 발급

2. 프로젝트 클론
   git clone https://github.com/username/sharesphere.git
   cd sharesphere

3. Firebase 설정

Firebase 콘솔에서 새 프로젝트를 생성합니다.
google-services.json (Android) 및 GoogleService-Info.plist (iOS)를 다운로드하여 프로젝트에 추가합니다.
Android: android/app/ 폴더에 추가
iOS: ios/Runner/ 폴더에 추가


Firebase CLI를 설치하고, 프로젝트 디렉토리에서 아래 명령어를 실행합니다:firebase init


Firestore와 Storage를 활성화합니다.

4. 구글 및 카카오 로그인 설정

구글 로그인:
pubspec.yaml에 google_sign_in 패키지를 추가합니다:dependencies:
google_sign_in: ^6.2.1


Firebase Authentication에서 구글 로그인을 활성화합니다.


카카오 로그인:
pubspec.yaml에 kakao_flutter_sdk 패키지를 추가합니다:dependencies:
kakao_flutter_sdk: ^1.9.2


카카오 개발자 콘솔에서 앱을 등록하고, 네이티브 앱 키를 android/app/src/main/AndroidManifest.xml에 추가합니다.



5. 종속성 설치 및 실행
   flutter pub get
   flutter run

🖥️ 사용 방법

앱을 실행하면 로그인 화면이 표시됩니다.
구글 또는 카카오 계정으로 로그인합니다.
상단의 가로 스크롤 메뉴에서 원하는 카테고리를 선택합니다 (예: 영화, 드라마).
파일 목록에서 파일을 선택하여 세부 정보를 확인합니다.
페이지 네비게이션을 통해 더 많은 파일을 탐색합니다.

📈 향후 계획

파일 업로드 기능: 사용자가 직접 파일을 업로드할 수 있도록 구현.
검색 기능: 파일 제목이나 업로더로 검색 가능.
파일 다운로드 기능: Firebase Storage를 통해 파일 다운로드 제공.
사용자 프로필: 사용자 프로필 페이지 추가.
알림 시스템: 파일 업로드 및 다운로드 알림 기능.

ShareSphere와 함께 파일 공유의 새로운 경험을 시작하세요! 🚀
