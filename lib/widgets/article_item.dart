import 'package:flutter/material.dart';
import 'package:isostar/models/article_model.dart';

class ArticleItem extends StatelessWidget {
  final ArticleModel article;
  const ArticleItem({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(
          article.image,
          fit: BoxFit.contain,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '좋아요 ${article.likes}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(article.user),
              Text(article.content),
            ],
          ),
        )
      ],
    );
  }
}
