import 'package:flutter_news_app_bloc/core/resources/data_state.dart';
import 'package:flutter_news_app_bloc/core/usecases/usecase.dart';
import 'package:flutter_news_app_bloc/features/news/data/data_sources/article_entity.dart';
import 'package:flutter_news_app_bloc/features/news/domain/repository/article_repository.dart';

class GetArticleUsecase
    implements UseCase<DataState<List<ArticleEntity>>, void> {
  final ArticleRepository _articleRepository;

  GetArticleUsecase(this._articleRepository);

  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return _articleRepository.getArticles();
  }
}
