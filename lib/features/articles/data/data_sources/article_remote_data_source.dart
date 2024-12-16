import 'package:ny_times/core/api/api_consumer.dart';
import 'package:ny_times/core/api/endpoints.dart';
import 'package:ny_times/features/articles/data/models/article_model.dart';
import 'package:ny_times/injection_container.dart';

abstract class ArticleRemoteDataSource{
  Future<NewsResponse> getRemoteArticleData();

}
class ArticleRemoteDataSourceImpl extends ArticleRemoteDataSource{
  ArticleRemoteDataSourceImpl();
  @override
  Future<NewsResponse> getRemoteArticleData() async{
    final response=await getIt<ApiConsumer>().get(EndPoints.query);
    return NewsResponse.fromJson(response);
  }
}