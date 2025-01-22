import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app_bloc/core/resources/data_state.dart';
import 'package:flutter_news_app_bloc/features/news/domain/usecases/get_article_usecase.dart';
import 'package:flutter_news_app_bloc/features/news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:flutter_news_app_bloc/features/news/presentation/bloc/article/remote/remote_article_state.dart';

class RemoteArticleBloc extends Bloc<RemoteArticleEvent, RemoteArticleState> {
  final GetArticleUsecase _getArticleUsecase;

  RemoteArticleBloc(this._getArticleUsecase)
      : super(const RemoteArticlesLoading()) {
    on<GetArticles>(onGetArticles);
  }

  void onGetArticles(
      GetArticles event, Emitter<RemoteArticleState> emit) async {
    final dataState = await _getArticleUsecase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(
        RemoteArticlesLoaded(
          articles: dataState.data!,
        ),
      );
    }

    if (dataState is DataFailed) {
      emit(
        RemoteArticlesError(
          error: dataState.error!,
        ),
      );
    }
  }
}
