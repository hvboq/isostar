import 'package:flutter/material.dart';
import 'package:isostar/models/article_model.dart';
import 'package:isostar/widgets/article_item.dart';

class ArticleScreen extends StatefulWidget {
  final List<ArticleModel> articles;
  final Function getArticle;
  const ArticleScreen({
    super.key,
    required this.articles,
    required this.getArticle,
  });

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        widget.getArticle();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.articles.isNotEmpty
        ? ListView.builder(
            itemCount: widget.articles.length,
            controller: _scrollController,
            itemBuilder: (c, i) => ArticleItem(article: widget.articles[i]))
        : const CircularProgressIndicator();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
