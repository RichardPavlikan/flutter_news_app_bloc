import 'package:flutter_news_app_bloc/core/resources/data_state.dart';
import 'package:flutter_news_app_bloc/features/news/data/data_sources/article_entity.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getArticles();
}
