import 'dart:convert';
import 'dart:io';

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
    return Uri.http('hackatum.robinh.xyz:6942', "api/v1" + path, query);
  }

  Future<dynamic> _fetchJSON(Uri uri) async {
    var withCode = await fetchJSON(uri) as Map<String, dynamic>;
    if (withCode.containsKey("code") && withCode["code"] != 0) {
      throw Exception(
          withCode["message"] ?? "error code ${withCode['code']} is non-zero");
    }

    return withCode["data"];
  }

  Future<List<Topic>> topics() async {
    var uri = _endpoint("/topic/list", {});

    var list = await _fetchJSON(uri) as List<dynamic>;

    return list.map((e) => Topic.fromJson(e)).toList();
  }

  Future<GeneratedQuiz> generateQuiz(int topicId, [int size = 10]) async {
    var uri = _endpoint("/quiz/generate/", {
      "topic_id": "$topicId",
      "size": "$size",
    });

    var quiz = await _fetchJSON(uri);

    return GeneratedQuiz.fromJson(quiz);
  }

  Future<QuizSubmissionResponse> evaluateQuizTotal(
    List<QuizSubmission> submissions,
  ) async {
    var uri = _endpoint("/quiz/evaluate/total/", {});

    var reqBody = jsonEncode(submissions);

    var response = await APIClient.httpClient.post(
      uri,
      body: reqBody,
      headers: {
        "Accept": "application/json",
        "User-Agent": "munich_data_quiz",
      },
    );

    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw HttpException("Unexpected status code ${response.statusCode}");
    }

    var obj =
        jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;

    if (obj.containsKey("code") && obj["code"] != 0) {
      throw Exception(
          obj["message"] ?? "error code ${obj['code']} is non-zero");
    }

    return QuizSubmissionResponse.fromJson(obj);
  }
}
