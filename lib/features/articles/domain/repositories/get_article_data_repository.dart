import 'package:dartz/dartz.dart';
import 'package:ny_times/features/articles/domain/entities/news_response_entity.dart';

abstract class GetArticleDataRepository{
  Future<Either<Exception,NewsResponseEntity>> getArticleData();

}