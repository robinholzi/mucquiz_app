

class MQAssets {
  static const String _dummyMunichImageBase_pre = "assets/img/dummy/munich_";
  static const String _dummyMunichImageBase_post = ".png";
  static int dummyMunichImageFirstNr = 1;
  static int dummyMunichImageLastNr = 5;

  // start with 1
  static String dummyMunichImage (int nr) {
    return _dummyMunichImageBase_pre
        + nr.toString() + _dummyMunichImageBase_post;
  }

  static String placeholderUser = "assets/img/auth/placeholders/user_placeholder.png";
}