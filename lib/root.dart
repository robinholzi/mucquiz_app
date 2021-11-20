

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:munich_data_quiz/constants/text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(MQTexts.appName),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: const TopicListPage(),
      ),
    );
  }
}
