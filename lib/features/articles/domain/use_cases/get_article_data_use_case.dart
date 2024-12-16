import 'package:dartz/dartz.dart';
import 'package:ny_times/core/usecases/usecase.dart';
import 'package:ny_times/features/articles/data/models/article_model.dart';
import 'package:ny_times/features/articles/domain/repositories/get_article_data_repository.dart';
import 'package:ny_times/injection_container.dart';

class GetArticleDataUseCase implements UseCase<NewsResponse,NoParams>{
  @override
    Future<Either<Exception, NewsResponse>>? call(NoParams params) => getIt<GetArticleDataRepository>().getArticleData();
}