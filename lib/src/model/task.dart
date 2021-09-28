class Task {
  final int id;
  final int point;
  final String label;
  final String description;
  // final String emoji;
  final String createdAt;
  final String updatedAt;

  Task(
      {required this.id,
      required this.point,
      required this.label,
      required this.description,
      // required this.emoji,
      required this.createdAt,
      required this.updatedAt});

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
        id: json['id'] as int,
        point: json['point'] as int,
        label: json['label'] as String,
        description: json['description'] as String,
        // emoji: json['emoji'] as String,
        createdAt: json['createdAt'] as String,
        updatedAt: json['updatedAt'] as String);
  }
}
