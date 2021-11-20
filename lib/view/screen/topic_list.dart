import 'package:flutter/material.dart';
import 'package:munich_data_quiz/api/models.dart';
import 'package:munich_data_quiz/api/quiz_api.dart';
import 'package:munich_data_quiz/constants/color.dart';
import 'package:munich_data_quiz/constants/theme.dart';
import 'package:munich_data_quiz/view/screen/topic_details.dart';
import 'package:munich_data_quiz/view/widget/card/notification_single_line_card.dart';
import 'package:munich_data_quiz/widgets/topic.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class TopicListPage extends StatefulWidget {
  const TopicListPage({Key? key}) : super(key: key);

  @override
  _TopicListPageState createState() => _TopicListPageState();
}

class _TopicListPageState extends State<TopicListPage> {

  bool loading = true;
  List<Topic> topics = [];
  RefreshController _refreshController = RefreshController(
      initialRefresh: false);

  String _error = "";

  Future<void> rebuildCommunityList() async {
    setLoading();
    topics.clear();

    var topicsRaw = await QuizAPI().topics().onError((error, stackTrace) {
      _error = error.toString();
      return [];
    });

    for (Topic newTopicsRaw in topicsRaw) {
      var find = topics.where((element) => element.id == newTopicsRaw.id);
      if (find.isEmpty) { // topic not yet present
        topics.add(newTopicsRaw);
      }
    }
    setLoading(l: false);
  }

  void setLoading({bool l = true}) {
    setState(() {
      loading = l;
    });
  }

  @override
  void initState() {
    super.initState();
    rebuildCommunityList();
  }

  void _onRefresh() async{
    rebuildCommunityList();
    _refreshController.refreshCompleted();
  }

  void _onLoading() async{
    if(mounted)
      setState(() {});
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    Widget comList;

    if (loading) {
      comList = Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Padding(
            padding: EdgeInsets.all(18.0),
            child: CircularProgressIndicator(),
          )
        ],
      );
    } else {
      if (topics.isEmpty) {
        comList = Padding(
          padding: EdgeInsets.symmetric(vertical: 34,
              horizontal: MQTheme.screenPaddingH
          ),
          child: Column(
            children: [
              RichText(
                overflow: TextOverflow.ellipsis,
                maxLines: 1000,
                text: TextSpan(
                    style: MQTheme.defaultTextStyle,
                    text: "No topics found."
                ),
              ),
              InfoCard(
                cardColor: MQColor.primaryColor,
                text: "asaasasdf asfasdf asdf asdf  asdf asdf asdasdf"
                    " asdf asdf asdf asdf asdf asdf asdf asdf Dasd asdf", // TODO test
              ),
            ],
          ),
        );
      } else {
        comList = ListView.builder(
          itemBuilder: (c, i) => TopicWidget(
            topic: topics[i],
            onTap: () async {
              await Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => TopicPage(topics[i]),
              ));
            },
          ),
          itemCount: topics.length,
          physics: BouncingScrollPhysics(),
          cacheExtent: MediaQuery.of(context).size.height * 2,
        );
      }
    }

    return Column(
      children: [
        Expanded(
          child: SmartRefresher(
              enablePullDown: true,
              enablePullUp: true,
              header: MaterialClassicHeader(), // WaterDropHeader
              footer: ClassicFooter(),
              controller: _refreshController,
              onRefresh: _onRefresh,
              onLoading: _onLoading,
              child: comList
          ),
        ),
      ],
    );
  }
}
