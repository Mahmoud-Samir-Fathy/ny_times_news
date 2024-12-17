import 'package:ny_times/features/articles/domain/entities/news_response_entity.dart';

abstract class ArticleStates{}
class ArticleInitialState extends ArticleStates{}
class ArticleLoadingState extends ArticleStates{}
class ArticleSuccessState extends ArticleStates{
  final NewsResponseEntity article;

  ArticleSuccessState({required this.article});
}
class ArticleErrorState extends ArticleStates{
  final String message;

  ArticleErrorState({required this.message});
}