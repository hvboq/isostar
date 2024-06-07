import 'package:flutter/material.dart';
import 'package:isostar/widgets/article_item.dart';

class ArticleScreen extends StatelessWidget {
  final articles = [
    ArticleItem(author: "글쓴이", content: "글내용", goodCount: 100),
    ArticleItem(author: "글쓴이", content: "글내용", goodCount: 100),
    ArticleItem(author: "글쓴이", content: "글내용", goodCount: 100),
  ];
  ArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: articles.length, itemBuilder: (c, i) => articles[i]);
  }
}
