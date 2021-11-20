import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:munich_data_quiz/api/models.dart';
import 'package:munich_data_quiz/pages/quiz_page.dart';
import 'package:munich_data_quiz/widgets/image_widget.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class TopicPage extends StatefulWidget {
  const TopicPage(this.topic, {Key? key}) : super(key: key);

  final Topic topic;

  @override
  _TopicPageState createState() => _TopicPageState();
}

class _TopicPageState extends State<TopicPage> {
  final _btnController = RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.topic.title),
      ),
      body: Center(
        child: Column(
          children: [
            ImageWidget(
              widget.topic.imageUrl,
              heroTag: "topic-image",
              id: widget.topic.topicId,
            ),
            const Divider(),
            Text(
              widget.topic.title,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (widget.topic.description != null)
              Container(
                padding: const EdgeInsets.only(top: 4),
                margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                child: Text(
                  widget.topic.description!,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            const Divider(),
            RoundedLoadingButton(
              controller: _btnController,
              onPressed: () async {
                // TODO: Load data
                await Future.delayed(const Duration(seconds: 1));

                var quiz = GeneratedQuiz(
                  topic: widget.topic,
                  questions: [
                    QuizQuestion(
                      id: 1,
                      title:
                          "Was ist wenn wir einfach eine echt lange Frage hätten, die definitiv mehrere Zeilen braucht?",
                      // description: "Zahlen kann man typischerweise Addieren.",
                      description: null,
                      imgUrl: "https://via.placeholder.com/350x150",
                      answers: [
                        QuizAnswer(id: 4, text: "Lorem ipsum dolor sit amet"),
                        QuizAnswer(id: 3, text: "😂👍"),
                        QuizAnswer(id: 2, text: " ipsum dolor sit"),
                        QuizAnswer(id: 1, text: "Lorem amet sönderzäichen"),
                      ],
                    ),
                    QuizQuestion(
                      id: 2,
                      title: "Was ist 3-3?",
                      description:
                          "Zahlen kann man typischerweise Subtrahieren.",
                      imgUrl: "https://via.placeholder.com/350x150",
                      answers: [
                        QuizAnswer(id: 3, text: "😂👍"),
                        QuizAnswer(id: 1, text: "Lorem amet sönderzäichen"),
                        QuizAnswer(
                            id: 2,
                            text:
                                "Diese Antwort ist etwas länger. Mal schauen, wie das auf dem UI aussieht."),
                        QuizAnswer(id: 4, text: "Lorem ipsum dolor sit amet"),
                      ],
                    ),
                    QuizQuestion(
                      id: 3,
                      title: "Does this question have any images?",
                      // description: "Zahlen kann man typischerweise Addieren.",
                      description: "No images to be seen",
                      imgUrl: null,
                      answers: [
                        QuizAnswer(id: 3, text: "😂👍"),
                        QuizAnswer(id: 1, text: "Lorem amet sönderzäichen"),
                      ],
                    ),
                  ],
                );

                await Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => QuizPage(widget.topic, quiz),
                ));

                try {
                  _btnController.success();
                } catch (_) {}

                await Future.delayed(
                  const Duration(seconds: 1),
                  () => _btnController.reset(),
                );
              },
              child: Text(AppLocalizations.of(context)!.startQuiz),
            ),
          ],
        ),
      ),
    );
  }
}
