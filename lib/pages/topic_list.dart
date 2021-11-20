import 'package:flutter/material.dart';
import 'package:munich_data_quiz/api/models.dart';
import 'package:munich_data_quiz/api/quiz_api.dart';
import 'package:munich_data_quiz/pages/topic_details.dart';
import 'package:munich_data_quiz/widgets/topic.dart';

class TopicListPage extends StatefulWidget {
  const TopicListPage({Key? key}) : super(key: key);

  @override
  _TopicListPageState createState() => _TopicListPageState();
}

class _TopicListPageState extends State<TopicListPage> {
  Widget _topicList(List<Topic> topics) {
    return ListView.builder(
      itemCount: topics.length,
      itemBuilder: (context, index) {
        return TopicWidget(
          topic: topics[index],
          onTap: () async {
            await Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => TopicPage(topics[index]),
            ));
          },
        );
      },
      // Preload images for the next 2 screen
      cacheExtent: MediaQuery.of(context).size.height * 2,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<List<Topic>>(
        future: QuizAPI().topics(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return ErrorWidget(snapshot.error!);
          }

          if (snapshot.hasData) {
            return _topicList(snapshot.data!);
          }

          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
