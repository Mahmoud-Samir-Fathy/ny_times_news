import 'package:dartz/dartz.dart';
import 'package:ny_times/core/usecases/usecase.dart';
import 'package:ny_times/features/articles/domain/entities/news_response_entity.dart';
import 'package:ny_times/features/articles/domain/repositories/get_article_data_repository.dart';
import 'package:ny_times/injection_container.dart';

class GetArticleDataUseCase implements UseCase<NewsResponseEntity,NoParams>{
  @override
    Future<Either<Exception, NewsResponseEntity>>? call(NoParams params) => getIt<GetArticleDataRepository>().getArticleData();
}