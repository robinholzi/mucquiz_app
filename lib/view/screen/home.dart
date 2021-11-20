
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:munich_data_quiz/view/screen/topic_list.dart';
import 'package:munich_data_quiz/view/style/screen/base_titled.dart';
import 'package:munich_data_quiz/widgets/title/titlebar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return BaseScreenTitled(
      titleBar: DefaultTitleBar(),
      child: const TopicListPage(),
    );
  }

}
