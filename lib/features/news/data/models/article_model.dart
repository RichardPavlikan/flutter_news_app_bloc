import 'package:flutter_news_app_bloc/features/news/data/data_sources/article_entity.dart';

class ArticleModel extends ArticleEntity {
  const ArticleModel({
    int? id,
    String? title,
    String? imageUrl,
    List<dynamic>? categories,
    String? author,
    String? content,
    String? publishedAt,
    String? url,
  }) : super(
          id: id,
          title: title,
          imageUrl: imageUrl,
          categories: categories,
          author: author,
          content: content,
          publishedAt: publishedAt,
          url: url,
        );

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      id: json['id'] as int?,
      title: json['title']['rendered'] as String?,
      imageUrl: json['yoast_head_json']['og_image'][0]['url'] as String?,
      categories: json['categories'] as List<dynamic>?,
      author: json['yoast_head_json']['twitter_misc']['Autor'] as String?,
      content: json['content']['rendered'] as String?,
      publishedAt: json['date'] as String?,
      url: json['link'] as String?,
    );
  }
}
