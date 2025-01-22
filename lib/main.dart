import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app_bloc/config/theme/app_theme.dart';
import 'package:flutter_news_app_bloc/features/news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:flutter_news_app_bloc/features/news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:flutter_news_app_bloc/features/news/presentation/pages/home/news_page.dart';
import 'package:flutter_news_app_bloc/injection_container.dart';

void main() async {
  // initialize dependencies
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticleBloc>(
      create: (context) => sl()..add(GetArticles()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeData(),
        home: const NewsPage(),
      ),
    );
  }
}
