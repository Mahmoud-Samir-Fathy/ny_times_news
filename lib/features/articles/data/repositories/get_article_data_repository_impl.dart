import 'package:dartz/dartz.dart';
import 'package:ny_times/core/error/exceptions.dart';
import 'package:ny_times/features/articles/data/data_sources/article_remote_data_source.dart';
import 'package:ny_times/features/articles/data/models/article_model.dart';
import 'package:ny_times/features/articles/domain/repositories/get_article_data_repository.dart';
import 'package:ny_times/injection_container.dart';

class GetArticleDataRepositoryImpl implements GetArticleDataRepository {

  GetArticleDataRepositoryImpl();


  @override
  Future<Either<Exception, NewsResponse>> getArticleData() async{
    try {
      final randomRemoteArticle =
          await getIt<ArticleRemoteDataSource>().getRemoteArticleData();
      return Right(randomRemoteArticle);
    } catch (e) {
      return const Left(ServerException());
    }
  }
}
