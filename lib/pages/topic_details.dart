import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:munich_data_quiz/api/models.dart';
import 'package:munich_data_quiz/api/quiz_api.dart';
import 'package:munich_data_quiz/model/dummy/dummy_numbers.dart';
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            ImageWidget(
              widget.topic.imageUrl,
              heroTag: "topic-image",
              id: "${widget.topic.id}",
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
                try {
                  var quiz = await QuizAPI().generateQuiz(
                    widget.topic.id,
                    DummyNumbers.getRandQuizSize,
                  );

                  await Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => QuizPage(widget.topic, quiz),
                  ));

                  // When the page is already swiped away, this no longer works.
                  try {
                    _btnController.success();
                  } catch (_) {}
                } catch (err) {
                  await showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(AppLocalizations.of(context)!.error),
                        content: Text("$err"),
                      );
                    },
                  );
                } finally {
                  try {
                    await Future.delayed(
                      const Duration(milliseconds: 400),
                      _btnController.reset,
                    );
                  } catch (_) {}
                }
              },
              child: Text(AppLocalizations.of(context)!.startQuiz),
            ),
          ],
        ),
      ),
    );
  }
}
