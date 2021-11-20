class Topic {
  Topic({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.id,
  });

  final String title;
  final String? description;
  final String? imageUrl;
  final int id;

  factory Topic.fromJson(Map<String, dynamic> json) {
    return Topic(
      title: json["title"],
      description: json["description"],
      imageUrl: json["img_url"],
      id: json["id"],
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
              json["questions"].map((x) => QuizQuestion.fromJson(x))),
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

class QuizSubmission {
  QuizSubmission({
    required this.questionId,
    required this.chosenAnswerIds,
  });

  int questionId;
  List<int> chosenAnswerIds;

  Map<String, dynamic> toJson() => {
        "question_id": questionId,
        "chosen_answer_ids": List<dynamic>.from(chosenAnswerIds.map((x) => x)),
      };
}

class QuizSubmissionResponse {
  QuizSubmissionResponse({
    required this.code,
    required this.title,
    required this.message,
    required this.data,
  });

  final int? code;
  final String? title;
  final String? message;
  final List<EvaluatedQuestion>? data;

  factory QuizSubmissionResponse.fromJson(Map<String, dynamic> json) {
    return QuizSubmissionResponse(
      code: json["code"],
      title: json["title"],
      message: json["message"],
      data: json["data"] == null
          ? null
          : List<EvaluatedQuestion>.from(
              json["data"].map((x) => EvaluatedQuestion.fromJson(x))),
    );
  }
}

class EvaluatedQuestion {
  EvaluatedQuestion({
    required this.questionId,
    required this.answerCorrect,
    required this.incorrectAnswers,
    required this.answerDetail,
  });

  final int questionId;
  final bool? answerCorrect;
  final List<IncorrectAnswer>? incorrectAnswers;
  final String? answerDetail;

  factory EvaluatedQuestion.fromJson(Map<String, dynamic> json) {
    return EvaluatedQuestion(
      questionId: json["question_id"],
      answerCorrect: json["answer_correct"],
      incorrectAnswers: json["incorrect_answers"] == null
          ? null
          : List<IncorrectAnswer>.from(json["incorrect_answers"]
              .map((x) => IncorrectAnswer.fromJson(x))),
      answerDetail: json["answer_detail"],
    );
  }
}

class IncorrectAnswer {
  IncorrectAnswer({
    required this.id,
    required this.text,
    required this.correct,
  });

  final int id;
  final String? text;
  final bool? correct;

  factory IncorrectAnswer.fromJson(Map<String, dynamic> json) {
    return IncorrectAnswer(
      id: json["id"],
      text: json["text"],
      correct: json["correct"],
    );
  }
}
