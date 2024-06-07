import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:isostar/models/article_model.dart';

class HttpService {
  final String _postsURL = "https://codingapple1.github.io/app";

  Future<List<ArticleModel>> getArticles() async {
    var result = await http.get(Uri.parse('$_postsURL/data.json'));
    if (result.statusCode == 200) {
      List<dynamic> jsonList = jsonDecode(result.body);
      return jsonList.map((json) => ArticleModel.fromJson(json)).toList();
    } else {
      throw Exception('server get error ${result.statusCode}');
    }
  }
}
