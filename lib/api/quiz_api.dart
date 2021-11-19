import 'package:munich_data_quiz/api/api_client.dart';
import 'package:munich_data_quiz/api/models.dart';

class QuizAPI extends APIClient {
  // Singleton: the QuizAPI "constructor" always returns the same object
  static final instance = QuizAPI._internal();
  factory QuizAPI() {
    return instance;
  }

  // Actual, private constructor
  QuizAPI._internal();

  Uri _endpoint(String path, Map<String, dynamic> query) {
    return Uri.https('url_todo', "/v1" + path, query);
  }

  Future<List<Topic>> topics() async {
    var query = <String, dynamic>{};

    var uri = _endpoint("/topics", query);

    var list = await fetchJSON(uri) as List<dynamic>;

    return list.map((e) => Topic.fromJson(e)).toList();
  }
}
