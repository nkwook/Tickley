class User {
  final int id;
  final String nickname;
  final String profile_image;
  final List<int> done_tasks;

  User({
    required this.id,
    required this.nickname,
    required this.profile_image,
    required this.done_tasks,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      nickname: json['label'] as String,
      profile_image: json['profile_image'] as String,
      done_tasks: json['done_tasks'] as List<int>,
    );
  }
}
