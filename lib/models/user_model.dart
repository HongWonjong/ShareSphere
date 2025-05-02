class UserModel {
  final String uid;
  final String displayName;
  final String email;
  final String? photoUrl;

  UserModel({
    required this.uid,
    required this.displayName,
    required this.email,
    this.photoUrl,
  });

  factory UserModel.fromMap(Map<String, dynamic> data) {
    return UserModel(
      uid: data['uid'] ?? '',
      displayName: data['displayName'] ?? 'Unknown',
      email: data['email'] ?? '',
      photoUrl: data['photoUrl'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'displayName': displayName,
      'email': email,
      'photoUrl': photoUrl,
    };
  }
}