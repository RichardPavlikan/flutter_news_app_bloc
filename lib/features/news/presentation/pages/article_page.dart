import 'package:flutter/material.dart';
import 'package:flutter_news_app_bloc/features/news/data/data_sources/article_entity.dart';

class ArticlePage extends StatelessWidget {
  const ArticlePage({required this.article, super.key});

  final ArticleEntity article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(article.content!),
      ),
    );
  }
}
