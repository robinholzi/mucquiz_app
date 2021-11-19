class Topic {
  Topic({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.topicId,
  });

  final String title;
  final String? description;
  final String? imageUrl;
  final String topicId;

  factory Topic.fromJson(Map<String, dynamic> json) {
    return Topic(
      title: json["title"],
      description: json["description"],
      imageUrl: json["image_url"],
      topicId: json["topic_id"],
    );
  }
}
