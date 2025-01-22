import 'package:dio/dio.dart';
import 'package:flutter_news_app_bloc/features/news/data/data_sources/remote/news_api_service.dart';
import 'package:flutter_news_app_bloc/features/news/data/repository/article_repository_implementation.dart';
import 'package:flutter_news_app_bloc/features/news/domain/repository/article_repository.dart';
import 'package:flutter_news_app_bloc/features/news/domain/usecases/get_article_usecase.dart';
import 'package:flutter_news_app_bloc/features/news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio
  sl.registerSingleton<Dio>(Dio());

  // Dependencies
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));

  sl.registerSingleton<ArticleRepository>(
    ArticleRepositoryImplementation(
      sl(),
    ),
  );

  // usecases
  sl.registerSingleton<GetArticleUsecase>(
    GetArticleUsecase(
      sl(),
    ),
  );

  // get article bloc
  sl.registerFactory<RemoteArticleBloc>(
    () => RemoteArticleBloc(
      sl(),
    ),
  );
}
