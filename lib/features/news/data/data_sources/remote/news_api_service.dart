import 'package:dio/dio.dart';
import 'package:flutter_news_app_bloc/features/news/data/models/article_model.dart';

class NewsApiService {
  final Dio dio;

  NewsApiService(this.dio);

  Future<Response<List<ArticleModel>>> getArticles({
    int? perPage,
    int? category,
  }) async {
    final result = await dio.get(
      'https://www.24dnes.sk/wp-json/wp/v2/posts?per_page=$perPage&categories=$category',
    );

    final List<ArticleModel> articles = (result.data as List<dynamic>)
        .map<ArticleModel>((article) => ArticleModel.fromJson(article))
        .toList();

    if (result.statusCode == 200) {
      return Response(
        requestOptions: result.requestOptions,
        data: articles,
        statusCode: result.statusCode,
        statusMessage: result.statusMessage,
      );
    } else {
      throw Exception(
        "Error: ${result.statusCode}",
      );
    }
  }
}
