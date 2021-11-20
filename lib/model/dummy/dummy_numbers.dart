import 'package:munich_data_quiz/model/random.dart';

class DummyNumbers {
  static int get getRandQuizSize => 4 + mqRand.nextInt(6);
}
