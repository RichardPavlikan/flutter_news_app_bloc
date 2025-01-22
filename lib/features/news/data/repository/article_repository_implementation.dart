import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:flutter_news_app_bloc/core/resources/data_state.dart';
import 'package:flutter_news_app_bloc/features/news/data/data_sources/remote/news_api_service.dart';
import 'package:flutter_news_app_bloc/features/news/data/models/article_model.dart';
import 'package:flutter_news_app_bloc/features/news/domain/repository/article_repository.dart';

class ArticleRepositoryImplementation implements ArticleRepository {
  final NewsApiService _newsApiService;
  ArticleRepositoryImplementation(this._newsApiService);

  @override
  Future<DataState<List<ArticleModel>>> getArticles() async {
    try {
      final httpResponse = await _newsApiService.getArticles(
        perPage: 10,
        category: 21,
      );

      if (httpResponse.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data!);
      }

      return DataFailed(Exception(httpResponse.statusMessage));
    } on Exception catch (e) {
      debugPrint('Error: ${e.toString()}');
      return DataFailed(e);
    }
  }
}
