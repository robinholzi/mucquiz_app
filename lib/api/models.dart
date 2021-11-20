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

class GeneratedQuiz {
  GeneratedQuiz({
    required this.topic,
    required this.questions,
  });

  final Topic? topic;
  final List<QuizQuestion> questions;

  factory GeneratedQuiz.fromJson(Map<String, dynamic> json) {
    return GeneratedQuiz(
      topic: json["topic"] == null ? null : Topic.fromJson(json["topic"]),
      questions: json["questions"] == null
          ? []
          : List<QuizQuestion>.from(
              json["questions"].map((x) => Topic.fromJson(x))),
    );
  }
}

class QuizQuestion {
  QuizQuestion({
    required this.id,
    required this.title,
    required this.description,
    required this.imgUrl,
    required this.answers,
  });

  final int id;
  final String title;
  final String? description;
  final String? imgUrl;
  final List<QuizAnswer> answers;

  factory QuizQuestion.fromJson(Map<String, dynamic> json) {
    return QuizQuestion(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      imgUrl: json["img_url"],
      answers: json["answers"] == null
          ? []
          : List<QuizAnswer>.from(
              json["answers"].map((x) => QuizAnswer.fromJson(x))),
    );
  }
}

class QuizAnswer {
  QuizAnswer({
    required this.id,
    required this.text,
  });

  final int id;
  final String? text;

  factory QuizAnswer.fromJson(Map<String, dynamic> json) {
    return QuizAnswer(
      id: json["id"],
      text: json["text"],
    );
  }
}
