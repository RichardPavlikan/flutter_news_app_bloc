import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app_bloc/features/news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:flutter_news_app_bloc/features/news/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:flutter_news_app_bloc/features/news/presentation/pages/article_page.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  _buildAppBar() {
    return AppBar(
      title: const Text('24Dnes'),
    );
  }

  _buildBody() {
    return BlocBuilder<RemoteArticleBloc, RemoteArticleState>(
        builder: (_, state) {
      if (state is RemoteArticlesLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      if (state is RemoteArticlesError) {
        return Center(
          child: Text(state.error.toString()),
        );
      }

      if (state is RemoteArticlesLoaded) {
        return ListView.builder(
          itemCount: state.articles!.length,
          itemBuilder: (_, index) {
            final article = state.articles![index];

            return ListTile(
              onTap: () {
                Navigator.of(_).push(
                  MaterialPageRoute(
                    builder: (context) => ArticlePage(article: article),
                  ),
                );
              },
              title: CachedNetworkImage(imageUrl: article.imageUrl!),
              subtitle: Text((article.title ?? 0).toString()),
            );
          },
        );
      }

      return const SizedBox();
    });
  }
}
