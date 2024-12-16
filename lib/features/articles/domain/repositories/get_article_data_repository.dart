import 'package:dartz/dartz.dart';
import 'package:ny_times/features/articles/data/models/article_model.dart';

abstract class GetArticleDataRepository{
  Future<Either<Exception,NewsResponse>> getArticleData();

}