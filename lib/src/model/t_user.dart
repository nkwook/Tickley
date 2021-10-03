class TUser {
  final String accessToken;
  final String nickname;
  final int id;
  final int point;
  final String createdAt;
  final String updatedAt;
  // final String profileImage;

  TUser({
    required this.accessToken,
    required this.nickname,
    required this.id,
    required this.point,
    required this.createdAt,
    required this.updatedAt,
    // this.profileImage = "",
  });


  factory TUser.fromJson(Map<String, dynamic> json) {
    return TUser(
      id: json['id'] as int,
      point: json['point'] as int,
      accessToken: json['accessToken'] as String,
      nickname: json['nickname'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      // profileImage: json['profileImage'] as String,
    );
  }
}
