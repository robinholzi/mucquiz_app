import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:munich_data_quiz/api/models.dart';
import 'package:munich_data_quiz/api/quiz_api.dart';
import 'package:munich_data_quiz/constants/color.dart';
import 'package:munich_data_quiz/constants/theme.dart';
import 'package:munich_data_quiz/model/dummy/dummy_numbers.dart';
import 'package:munich_data_quiz/view/screen/quiz_page.dart';
import 'package:munich_data_quiz/view/style/screen/base_titled.dart';
import 'package:munich_data_quiz/view/widget/button/rounded_button.dart';
import 'package:munich_data_quiz/view/widget/dialog/popup_dialog_widget.dart';
import 'package:munich_data_quiz/widgets/image_widget.dart';
import 'package:munich_data_quiz/widgets/title/titlebar.dart';
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
    return BaseScreenTitled(
      titleBar: BasicTitleBar(title: widget.topic.title,),
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: MQTheme.screenPaddingH),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(MQTheme.radiusCard),
                child: ImageWidget(
                  widget.topic.imageUrl,
                  heroTag: "topic-image",
                  id: "${widget.topic.id}",
                ),
              ),
              SizedBox(height: MQTheme.cardPaddingBigV,),
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
                    textAlign: TextAlign.center,
                  ),
                ),
              SizedBox(height: MQTheme.cardPaddingBigV,),
              RoundedLoadingButton(
                controller: _btnController,
                child: Text(AppLocalizations.of(context)!.startQuiz,
                  style: TextStyle(
                    color: MQColor.textColor,
                    fontWeight: FontWeight.bold,
                ),),
                color: MQColor.primaryColor,
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
                        return PopupDialogWidget(
                            title: AppLocalizations.of(context)!.error,
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    bottom: 18.0,
                                    left: MQTheme.cardPaddingBigV,
                                    right: MQTheme.cardPaddingBigV,
                                  ),
                                  child: Text(
                                    "$err",
                                    maxLines: 4,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RoundedButton(
                                      text: AppLocalizations.of(context)!.okayGotIt,
                                      onClick: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                )
                              ],
                            )
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
