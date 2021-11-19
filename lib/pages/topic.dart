import 'package:flutter/material.dart';
import 'package:munich_data_quiz/api/models.dart';
import 'package:munich_data_quiz/widgets/image_widget.dart';

class TopicPage extends StatefulWidget {
  const TopicPage(this.topic, {Key? key}) : super(key: key);

  final Topic topic;

  @override
  _TopicPageState createState() => _TopicPageState();
}

class _TopicPageState extends State<TopicPage> {
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

            // TODO: Add start button
          ],
        ),
      ),
    );
  }
}
