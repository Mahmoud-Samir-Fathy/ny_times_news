import 'package:ny_times/features/articles/data/models/article_model.dart';

abstract class ArticleStates{}
class ArticleInitialState extends ArticleStates{}
class ArticleLoadingState extends ArticleStates{}
class ArticleSuccessState extends ArticleStates{
  final NewsResponse article;

  ArticleSuccessState({required this.article});
}
class ArticleErrorState extends ArticleStates{
  final String message;

  ArticleErrorState({required this.message});
}