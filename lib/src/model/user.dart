class User {
  final int id;
  final String nickname;
  final int point;
  final String profileImage;

  User({
    required this.id,
    required this.nickname,
    required this.point,
    required this.profileImage,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      nickname: json['label'] as String,
      point: json['point'] as int,
      profileImage: json['profileImage'] as String,
    );
  }
}
