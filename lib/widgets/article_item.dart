import 'package:flutter/material.dart';

class ArticleItem extends StatelessWidget {
  final String author;
  final String content;
  final int goodCount;
  const ArticleItem(
      {required this.author,
      required this.content,
      required this.goodCount,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          'assets/images/running-car.jpg',
          fit: BoxFit.contain,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '좋아요 $goodCount',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(author),
              Text(content),
            ],
          ),
        )
      ],
    );
  }
}
