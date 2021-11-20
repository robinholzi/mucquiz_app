import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:munich_data_quiz/api/models.dart';
import 'package:munich_data_quiz/api/quiz_api.dart';

class QuizResultPage extends StatefulWidget {
  const QuizResultPage(this.quiz, this.submission, {Key? key})
      : super(key: key);

  final GeneratedQuiz quiz;
  final List<QuizSubmission> submission;

  @override
  _QuizResultPageState createState() => _QuizResultPageState();
}

class _QuizResultPageState extends State<QuizResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.resultPageTitle),
      ),
      body: Center(
        child: FutureBuilder<QuizSubmissionResponse>(
          future: QuizAPI().evaluateQuizTotal(widget.submission),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return ErrorWidget(snapshot.error!);
            }
            if (snapshot.hasData) {
              return Text("${snapshot.data!.data!.length}");
            }

            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
