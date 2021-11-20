import 'package:flutter/material.dart';
import 'package:munich_data_quiz/api/models.dart';

class QuizQuestionWidget extends StatefulWidget {
  const QuizQuestionWidget(this.question, {Key? key}) : super(key: key);

  final QuizQuestion question;

  @override
  _QuizQuestionWidgetState createState() => _QuizQuestionWidgetState();
}

class _QuizQuestionWidgetState extends State<QuizQuestionWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(widget.question.title),
    );
  }
}
