import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:munich_data_quiz/api/models.dart';
import 'package:munich_data_quiz/api/quiz_api.dart';
import 'package:munich_data_quiz/widgets/image_widget.dart';

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
    var isCorrect = false;
    if (result.incorrectAnswers?.isNotEmpty ?? false) {
      var answers =
          result.incorrectAnswers!.where((element) => element.id == answer.id);

      isCorrect = answers.isNotEmpty ? answers.first.correct ?? false : false;
    }

    return CheckboxListTile(
      title: Text(
        answer.text ?? "",
        style: TextStyle(
          decoration: TextDecoration.lineThrough,
        ),
      ),
      value: isCorrect,
      onChanged: null,
    );
  }

  Widget _singleQuestionResult(
      QuizQuestion question, EvaluatedQuestion result) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          question.title,
          style: titleStyle,
          textAlign: TextAlign.center,
        ),
        if ((question.imgUrl ?? "").isNotEmpty)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ImageWidget(question.imgUrl!),
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
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.resultPageTitle),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(16),
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
