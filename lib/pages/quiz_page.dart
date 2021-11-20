import 'package:flutter/material.dart';
import 'package:munich_data_quiz/api/models.dart';
import 'package:munich_data_quiz/widgets/quiz_question.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';

class QuizPage extends StatefulWidget {
  const QuizPage(this.topic, this.quiz, {Key? key}) : super(key: key);

  final Topic topic;
  final GeneratedQuiz quiz;

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
        return QuizQuestionWidget(widget.quiz.questions[index]);
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
              _pageController.jumpToPage(i);
            }
          },
          itemCount: widget.quiz.questions.length,
          currentPageNotifier: _currentPageNotifier,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
