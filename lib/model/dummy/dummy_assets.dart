
import 'package:munich_data_quiz/constants/asset.dart';
import 'package:munich_data_quiz/model/random.dart';

class DummyAssets {

  static final List<String> _munichBaseImg = List.generate(
      MQAssets.dummyMunichImageLastNr,
      (idx) => MQAssets.dummyMunichImage(idx+1));

  static String get randMunichImage =>
      _munichBaseImg[mqRand.nextInt(_munichBaseImg.length)];

}