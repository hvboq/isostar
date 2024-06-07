import 'package:flutter/material.dart';
import 'package:isostar/models/article_model.dart';
import 'package:isostar/screens/article_list_screen.dart';
import './style.dart' as style;
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MaterialApp(theme: style.theme, home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentTab = 0;
  List<ArticleModel> articles = [];

  getArticles() async {
    var result = await http
        .get(Uri.parse('https://codingapple1.github.io/app/data.json'));
    if (result.statusCode == 200) {
      List<dynamic> jsonList = jsonDecode(result.body);
      setState(() => articles.addAll(
          jsonList.map((json) => ArticleModel.fromJson(json)).toList()));
    } else {
      throw Exception('server get error ${result.statusCode}');
    }
  }

  getArticle() async {
    var result = await http
        .get(Uri.parse('https://codingapple1.github.io/app/more1.json'));
    if (result.statusCode == 200) {
      setState(
          () => articles.add(ArticleModel.fromJson(jsonDecode(result.body))));
    } else {
      throw Exception('server get error ${result.statusCode}');
    }
  }

  @override
  void initState() {
    super.initState();
    getArticles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('이소스타'),
          actions: const <Widget>[Icon(Icons.add_box_outlined)],
        ),
        body: Center(
          child: [
            ArticleScreen(
              articles: articles,
              getArticle: getArticle,
            ),
            const Text('샵')
          ][currentTab],
        ),
        bottomNavigationBar: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            onTap: (idnex) => setState(() => currentTab = idnex),
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined), label: 'home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_bag_outlined), label: 'shop')
            ]));
  }
}
