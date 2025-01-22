import 'package:equatable/equatable.dart';

class ArticleEntity extends Equatable {
  final int? id;
  final String? title;
  final String? imageUrl;
  final List<dynamic>? categories;
  final String? author;
  final String? content;
  final String? publishedAt;
  final String? url;

  const ArticleEntity({
    this.id,
    this.title,
    this.imageUrl,
    this.categories,
    this.author,
    this.content,
    this.publishedAt,
    this.url,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        imageUrl,
        categories,
        author,
        content,
        publishedAt,
        url,
      ];
}
