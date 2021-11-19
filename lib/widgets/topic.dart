import 'dart:math';

import 'package:flutter/material.dart';
import 'package:munich_data_quiz/api/models.dart';
import 'package:munich_data_quiz/widgets/image_widget.dart';

class TopicWidget extends StatefulWidget {
  const TopicWidget({
    required this.topic,
    this.onTap,
    Key? key,
  }) : super(key: key);

  final Topic topic;

  final void Function()? onTap;

  @override
  _TopicWidgetState createState() => _TopicWidgetState();
}

class _TopicWidgetState extends State<TopicWidget> {
  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(10.0);
    return Center(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: radius,
        ),
        child: Material(
          color: Theme.of(context).cardColor,
          borderRadius: radius,
          child: InkWell(
            borderRadius: radius,
            onTap: () async {
              setState(() {});

              widget.onTap?.call();
            },
            child: Container(
              margin: (widget.topic.title).isEmpty
                  ? const EdgeInsets.only(bottom: 8)
                  : EdgeInsets.zero,
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      widget.topic.title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  if ((widget.topic.imageUrl ?? "").isNotEmpty)
                    SizedBox(
                      width: double.infinity,
                      height: max(MediaQuery.of(context).size.height / 4, 200),
                      child: ImageWidget(
                        widget.topic.imageUrl,
                        heroTag: "topic-image",
                        id: widget.topic.topicId,
                      ),
                    ),
                  if ((widget.topic.description ?? "").isNotEmpty)
                    Padding(
                      padding: widget.topic.imageUrl == null
                          ? const EdgeInsets.fromLTRB(8, 2, 8, 8)
                          : const EdgeInsets.fromLTRB(8, 8, 8, 4),
                      child: Text(
                        widget.topic.description!,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
