class Category {
  final int id;
  final String label;
  // final String description;
  final String emoji;

  Category({
    required this.id,
    required this.label,
    // required this.description,
    required this.emoji,
    // required this.createdAt,
    // required this.updatedAt
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] as int,
      label: json['label'] as String,
      // description: json['description'] as String,
      emoji: json['emoji'] as String,
    );
  }
}
