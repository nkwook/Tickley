class Task {
  final int id;
  final int point;
  final String label;
  final String description;
  final String emoji;

  Task({
    required this.id,
    required this.point,
    required this.label,
    required this.description,
    required this.emoji,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'] as int,
      point: json['point'] as int,
      label: json['label'] as String,
      description: json['description'] as String,
      emoji: json['emoji'] as String,
    );
  }
}
