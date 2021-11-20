import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:munich_data_quiz/api/models.dart';
import 'package:munich_data_quiz/widgets/quiz_question.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';

class QuizPage extends StatefulWidget {
  QuizPage(this.topic, this.quiz, {Key? key})
      // We need to generate a *unique* map for each question answer (List.fill would reuse the same map)
      : selectedAnswers = List.generate(quiz.questions.length, (_) => {}),
        super(key: key);

  final Topic topic;
  final GeneratedQuiz quiz;

  // At list index 0, all answer selections for question 0 are saved.
  // The map<int, bool> maps the answer id to a selection (boolean).
  final List<Map<int, bool>> selectedAnswers;

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final _pageController = PageController();
  final _currentPageNotifier = ValueNotifier<int>(0);

  PageView _questionView() {
    return PageView.builder(
      itemCount: widget.quiz.questions.length,
      controller: _pageController,
      itemBuilder: (BuildContext context, int index) {
        return QuizQuestionWidget(
          widget.quiz.questions[index],
          widget.selectedAnswers[index],
        );
      },
      onPageChanged: (int index) {
        _currentPageNotifier.value = index;
      },
    );
  }

  Positioned _dotIndicator() {
    return Positioned(
      left: 0.0,
      right: 0.0,
      bottom: 0.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CirclePageIndicator(
          size: 24,
          selectedSize: 24,
          onPageSelected: (i) {
            if (_currentPageNotifier.value != i) {
              _pageController.animateToPage(
                i,
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInOut,
              );
            }
          },
          itemCount: widget.quiz.questions.length,
          currentPageNotifier: _currentPageNotifier,
        ),
      ),
    );
  }

  // Ask the user before leaving the quiz if they are sure
  Future<bool> _beforeQuizLeave(BuildContext context) async {
    bool result = true;
    await showDialog(
      context: context,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            title: Text(AppLocalizations.of(context)!.cancelQuiz),
            content: Text(
              AppLocalizations.of(context)!.cancelQuizDescription,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  result = true;
                  Navigator.pop(context);
                },
                child: Text(AppLocalizations.of(context)!.yesCancel),
              ),
              TextButton(
                onPressed: () {
                  result = false;
                  Navigator.pop(context);
                },
                child: Text(AppLocalizations.of(context)!.no),
              )
            ],
          ),
        );
      },
    );
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _beforeQuizLeave(context),
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.topic.title),
        ),
        body: Column(
          children: [
            Expanded(
              child: _questionView(),
            ),
            _dotIndicator(),
          ],
        ),
      ),
    );
  }
}
