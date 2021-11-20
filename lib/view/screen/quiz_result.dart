import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:munich_data_quiz/api/models.dart';
import 'package:munich_data_quiz/api/quiz_api.dart';
import 'package:munich_data_quiz/constants/theme.dart';
import 'package:munich_data_quiz/view/style/screen/base_titled.dart';
import 'package:munich_data_quiz/widgets/image_widget.dart';
import 'package:munich_data_quiz/widgets/title/titlebar.dart';

class QuizResultPage extends StatefulWidget {
  const QuizResultPage(this.quiz, this.submission, {Key? key})
      : super(key: key);

  final GeneratedQuiz quiz;
  final List<QuizSubmission> submission;

  @override
  _QuizResultPageState createState() => _QuizResultPageState();
}

class _QuizResultPageState extends State<QuizResultPage> {
  static const titleStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  Widget _answer(
      BuildContext context, QuizAnswer answer, EvaluatedQuestion result) {
    var userGotitCorrect = true;
    if (result.incorrectAnswers?.isNotEmpty ?? false) {
      var answers =
          result.incorrectAnswers!.where((element) => element.id == answer.id);

      userGotitCorrect =
          answers.isNotEmpty ? answers.first.correct ?? false : false;
    }

    return CheckboxListTile(
      title: Text(
        answer.text ?? "",
        style: TextStyle(
          decoration: TextDecoration.lineThrough,
        ),
      ),
      tileColor: userGotitCorrect ? Colors.green : Colors.red,
      value: result.answerCorrect ?? false,
      onChanged: null,
    );
  }

  Widget _singleQuestionResult(
      QuizQuestion question, EvaluatedQuestion result) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if ((question.imgUrl ?? "").isNotEmpty)
          ClipRRect(
            borderRadius: const BorderRadius.all(MQTheme.radiusCard),
            child: ImageWidget(question.imgUrl!),
          ),
        Padding(
          padding: EdgeInsets.only(
              top: MQTheme.cardPaddingBigV,
              bottom: MQTheme.cardPaddingV),
          child: Text(
            question.title,
            style: titleStyle,
            textAlign: TextAlign.center,
          ),
        ),
        if ((question.description ?? "").isNotEmpty)
          Text(
            question.description!,
            textAlign: TextAlign.center,
          ),
        ...question.answers.map((a) => _answer(context, a, result))
      ],
    );
  }

  Widget _quizResultList(QuizSubmissionResponse response) {
    return ListView.builder(
      itemCount: widget.quiz.questions.length,
      itemBuilder: (BuildContext context, int index) {
        return _singleQuestionResult(
          widget.quiz.questions[index],
          response.data!.firstWhere(
            (element) => element.questionId == widget.quiz.questions[index].id,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreenTitled(
      titleBar: BasicTitleBar(
        title: (
            (widget.quiz.topic != null)
                ? (widget.quiz.topic!.title ?? "")
                : ""
        ),
      ),
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16),
        child: FutureBuilder<QuizSubmissionResponse>(
          future: QuizAPI().evaluateQuizTotal(widget.submission),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return ErrorWidget(snapshot.error!);
            }
            if (snapshot.hasData) {
              return _quizResultList(snapshot.data!);
            }

            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
