class TaskCompleted {
  final int id;
  final int point;
  final String label;
  final String description;
  final String emoji;
  final String completedAt;

  TaskCompleted({
    required this.id,
    required this.point,
    required this.label,
    required this.description,
    required this.emoji,
    required this.completedAt
  });

  factory TaskCompleted.fromJson(Map<String, dynamic> json) {
    return TaskCompleted(
      id: json['id'] as int,
      point: json['point'] as int,
      label: json['label'] as String,
      description: json['description'] as String,
      emoji: json['emoji'] as String,
      completedAt: json['completedAt'] as String,
    );
  }
}
