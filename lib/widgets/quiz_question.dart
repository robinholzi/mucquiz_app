import 'package:flutter/material.dart';
import 'package:munich_data_quiz/api/models.dart';
import 'package:munich_data_quiz/widgets/image_widget.dart';

class QuizQuestionWidget extends StatefulWidget {
  const QuizQuestionWidget(this.question, this.selectedAnswers, {Key? key})
      : super(key: key);

  final QuizQuestion question;

  // This map<int, bool> maps the answer id to the a boolean indicating a selection
  final Map<int, bool> selectedAnswers;

  @override
  _QuizQuestionWidgetState createState() => _QuizQuestionWidgetState();
}

class _QuizQuestionWidgetState extends State<QuizQuestionWidget> {
  static const titleStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  Widget _answer(BuildContext context, QuizAnswer answer) {
    return CheckboxListTile(
      title: Text(answer.text ?? ""),
      onChanged: (newValue) async {
        setState(() {
          widget.selectedAnswers[answer.id] = newValue ?? false;
        });
      },
      value: widget.selectedAnswers[answer.id] ?? false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            widget.question.title,
            style: titleStyle,
            textAlign: TextAlign.center,
          ),
          if ((widget.question.imgUrl ?? "").isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ImageWidget(widget.question.imgUrl!),
            ),
          if ((widget.question.description ?? "").isNotEmpty)
            Text(
              widget.question.description!,
              textAlign: TextAlign.center,
            ),
          ...widget.question.answers.map((a) => _answer(context, a))
        ],
      ),
    );
  }
}
