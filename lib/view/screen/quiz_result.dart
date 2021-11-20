import 'package:flutter/material.dart';
import 'package:munich_data_quiz/api/models.dart';
import 'package:munich_data_quiz/api/quiz_api.dart';
import 'package:munich_data_quiz/constants/color.dart';
import 'package:munich_data_quiz/constants/theme.dart';
import 'package:munich_data_quiz/controller/screen_size.dart';
import 'package:munich_data_quiz/view/style/screen/base_titled.dart';
import 'package:munich_data_quiz/widgets/image_widget.dart';
import 'package:munich_data_quiz/widgets/title/titlebar.dart';
import 'package:provider/provider.dart';

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
  Widget _answer(BuildContext context, QuizAnswer answer,
      EvaluatedQuestion result) {
    // Is this answer contained in the incorrect answers?
    bool userIncorrect = result.incorrectAnswers
            ?.any((incorrect) => answer.id == incorrect.id) ??
        false;

    QuizSubmission submitted = widget.submission
        .firstWhere((question) => question.questionId == result.questionId);

    bool selectedByUser = submitted.chosenAnswerIds.contains(answer.id);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: CheckboxListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(MQTheme.radiusCard * 2),
        ),
        title: Text(
          answer.text ?? "", style: MQTheme.defaultTextStyle,
        ),
        tileColor: userIncorrect ? Colors.redAccent : Colors.green[300],
        value: selectedByUser,
        onChanged: null,
      ),
    );
  }

  Widget _singleQuestionResult(BuildContext ctx,
      QuizQuestion question, EvaluatedQuestion result, bool isLast) {
    double maxWidth = Provider.of<ScreenSize>(ctx, listen: false).maxWidth * 0.18;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: MQTheme.screenPaddingH),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if ((question.imgUrl ?? "").isNotEmpty)
            ClipRRect(
              borderRadius: const BorderRadius.all(MQTheme.radiusCard),
              child: ImageWidget(question.imgUrl!),
            ),
          Padding(
            padding: EdgeInsets.only(
                top: MQTheme.cardPaddingBigV, bottom: MQTheme.cardPaddingBigV),
            child: Text(
              question.title,
              style: titleStyle,
              textAlign: TextAlign.center,
            ),
          ),
          if ((question.description ?? "").isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(bottom: 14, top: 8),
              child: Text(
                question.description!,
                textAlign: TextAlign.center,
              ),
            ),
          ...question.answers.map((a) => _answer(context, a, result)),
          if ((result.answerDetail ?? "").isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
              child: Text(result.answerDetail ?? "",
                style: MQTheme.defaultTextStyle, textAlign: TextAlign.center,),
            ),
          if (!isLast)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 14.0,
                      bottom: MQTheme.cardPaddingBigV * 3.14159),
                  child: Container(
                    width: maxWidth,
                    height: 3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: MQColor.primaryColor
                    ),
                  ),
                )
              ],
            )
        ],
      ),
    );
  }

  Widget _quizResultList(BuildContext ctx, QuizSubmissionResponse response) {
    return ListView.builder(
      itemCount: widget.quiz.questions.length,
      itemBuilder: (BuildContext context, int index) {
        return _singleQuestionResult(
          ctx,
          widget.quiz.questions[index],
          response.data!.firstWhere(
            (element) => element.questionId == widget.quiz.questions[index].id,
          ),
          widget.quiz.questions.length-1 == index
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreenTitled(
      titleBar: BasicTitleBar(
        title: ((widget.quiz.topic != null) ? (widget.quiz.topic!.title) : ""),
      ),
      child: Container(
        alignment: Alignment.center,
        child: FutureBuilder<QuizSubmissionResponse>(
          future: QuizAPI().evaluateQuizTotal(widget.submission),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return ErrorWidget(snapshot.error!);
            }
            if (snapshot.hasData) {
              return _quizResultList(context, snapshot.data!);
            }

            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
