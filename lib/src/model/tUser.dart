class TUser {
  final String nickname;
  final String accessToken;
  final String profileImage;

  TUser({
    required this.nickname,
    required this.accessToken,
    required this.profileImage,
  });

  factory TUser.fromJson(Map<String, dynamic> json) {
    return TUser(
      nickname: json['nickname'] as String,
      accessToken: json['accessToken'] as String,
      profileImage: json['profileImage'] as String,
    );
  }
}
