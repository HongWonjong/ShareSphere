import '../models/file_item.dart';

class FileRepository {
  final Map<String, List<FileItem>> _categoryFiles = {
    '영화': [
      FileItem(title: "볼만한 파일 안에서 얻은 이야기", size: "8.4G", uploader: "user1", description: "감동적인 스토리의 영화"),
      FileItem(title: "[완자] 5 warsaw rising brothers", size: "1.9G", uploader: "user2", description: "역사적 전쟁 드라마"),
      FileItem(title: "스타워즈: 새로운 희망", size: "12.5G", uploader: "user4", description: "SF 클래식 영화"),
    ],
    '드라마': [
      FileItem(title: "왕좌의 게임 시즌 1", size: "15.2G", uploader: "user5", description: "판타지 서사 드라마"),
      FileItem(title: "브레이킹 배드", size: "10.8G", uploader: "user6", description: "범죄 스릴러 드라마"),
    ],
    '음악': [
      FileItem(title: "클래식 모음집", size: "2.3G", uploader: "user7", description: "베토벤과 모차르트 명곡"),
      FileItem(title: "K-POP 히트곡", size: "1.8G", uploader: "user8", description: "최신 K-POP 모음"),
    ],
    '게임': [
      FileItem(title: "위쳐 3: 와일드 헌트", size: "45.6G", uploader: "user9", description: "오픈월드 RPG"),
    ],
    '소프트웨어': [
      FileItem(title: "파이참 커뮤니티 에디션", size: "1.2G", uploader: "user10", description: "Python IDE"),
    ],
    '문서': [
      FileItem(title: "플러터 튜토리얼", size: "0.5G", uploader: "user11", description: "플러터 학습 자료"),
    ],
    '이미지': [
      FileItem(title: "고해상도 풍경 사진", size: "3.4G", uploader: "user12", description: "자연 풍경 이미지"),
    ],
    '만화': [
      FileItem(title: "원피스 1-100권", size: "5.7G", uploader: "user13", description: "인기 만화 시리즈"),
    ],
    '애니메이션': [
      FileItem(title: "진격의 거인 시즌 1", size: "7.9G", uploader: "user14", description: "인기 애니메이션"),
    ],
    '스트리밍': [
      FileItem(title: "유튜브 라이브 스트리밍", size: "N/A", uploader: "user15", description: "실시간 스트리밍"),
    ],
  };

  Map<String, List<FileItem>> getCategoryFiles() => _categoryFiles;
}