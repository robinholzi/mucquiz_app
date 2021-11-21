import 'package:flutter/material.dart';
import 'package:munich_data_quiz/api/models.dart';
import 'package:munich_data_quiz/constants/theme.dart';
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
    return AnswerCheckbox(answer, widget.selectedAnswers);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: MQTheme.screenPaddingH),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if ((widget.question.imgUrl ?? "").isNotEmpty)
              ClipRRect(
                borderRadius: const BorderRadius.all(MQTheme.radiusCard),
                child: ImageWidget(widget.question.imgUrl!),
              ),
            Padding(
              padding: EdgeInsets.only(
                top: MQTheme.cardPaddingBigV,
                bottom: MQTheme.cardPaddingV,
              ),
              child: Text(
                widget.question.text,
                style: titleStyle,
                textAlign: TextAlign.center,
              ),
            ),
            if ((widget.question.description ?? "").isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 18.0),
                child: Text(
                  widget.question.description!,
                  textAlign: TextAlign.center,
                ),
              ),
            ...widget.question.answers.map((a) => _answer(context, a))
          ],
        ),
      ),
    );
  }
}

class AnswerCheckbox extends StatefulWidget {
  const AnswerCheckbox(this.answer, this.selectedAnswers, {Key? key})
      : super(key: key);

  final QuizAnswer answer;
  final Map<int, bool> selectedAnswers;

  @override
  _AnswerCheckboxState createState() => _AnswerCheckboxState();
}

class _AnswerCheckboxState extends State<AnswerCheckbox> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(MQTheme.radiusCard * 2),
      ),
      title: Text(
        widget.answer.text ?? "",
        style: MQTheme.defaultTextStyle,
      ),
      onChanged: (newValue) async {
        setState(() {
          widget.selectedAnswers[widget.answer.id] = newValue ?? false;
        });
      },
      value: widget.selectedAnswers[widget.answer.id] ?? false,
    );
  }
}
