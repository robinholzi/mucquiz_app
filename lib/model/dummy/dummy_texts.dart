
import 'package:munich_data_quiz/model/random.dart';

class DummyTexts {

  static final List<String> _topicTitles = [
    "Politics",
    "Football",
    "Academics",
    "Housing",
    "Demographics"
  ];

  static String get getRandTopicTitle =>
      _topicTitles[mqRand.nextInt(_topicTitles.length)];

  static final List<String> _quizTitles = [
    "QuizTest1",
    "Lorem Ipsum",
    "QuizTest2",
    "QuizTest3",
    "QuizTest4",
  ];

  static String get getRandQuizTitle =>
      _quizTitles[mqRand.nextInt(_quizTitles.length)];

  static final List<String> _description = [
    "ligula ullamcorper malesuada proin libero nunc consequat interdum varius sit amet mattis vulputate enim nulla",
    "nibh sit amet commodo nulla facilisi nullam vehicula ipsum a arcu cursus vitae congue mauris rhoncus aenean vel elit scelerisque mauris pellentesque pulvinar pellentesque habitant",
    "gravida rutrum quisque non tellus orci ac auctor augue mauris augue neque gravida in fermentum et sollicitudin ac orci phasellus egestas tellus rutrum tellus pellentesque eu tincidunt tortor aliquam nulla facilisi cras fermentum odio eu",
    "et molestie ac feugiat sed lectus vestibulum mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare massa eget egestas purus viverra accumsan in nisl nisi scelerisque eu ultrices vitae auctor eu augue ut lectus arcu bibendum at varius vel pharetra vel turpis nunc eget lorem dolor",
    "sem integer vitae justo eget magna fermentum iaculis eu non diam phasellus vestibulum lorem sed risus ultricies tristique nulla aliquet enim tortor at auctor urna nunc id cursus metus aliquam eleifend mi in nulla posuere sollicitudin aliquam ultrices sagittis orci a scelerisque purus semper eget duis at tellus at urna condimentum mattis pellentesque id nibh",
    "aliquam etiam erat velit scelerisque in dictum non consectetur a erat nam at lectus urna duis convallis convallis tellus id interdum velit laoreet id donec ultrices tincidunt arcu non sodales neque sodales ut etiam sit amet nisl purus in mollis nunc sed id semper risus in hendrerit gravida rutrum quisque non tellus orci ac auctor augue mauris augue neque gravida in fermentum et sollicitudin ac",
  ];

  static String get getDescription =>
      _description[mqRand.nextInt(_description.length)];

}