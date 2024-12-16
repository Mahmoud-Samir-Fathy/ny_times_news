import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:ny_times/core/api/api_consumer.dart';
import 'package:ny_times/core/api/app_interceptor.dart';
import 'package:ny_times/core/api/dio_consumer.dart';
import 'package:ny_times/features/articles/data/data_sources/article_remote_data_source.dart';
import 'package:ny_times/features/articles/data/repositories/get_article_data_repository_impl.dart';
import 'package:ny_times/features/articles/domain/repositories/get_article_data_repository.dart';
import 'package:ny_times/features/articles/domain/use_cases/get_article_data_use_case.dart';
import 'package:ny_times/features/articles/presentation/manager/cubit.dart';

final getIt = GetIt.instance;

Future<void> init() async {
//! Feature

//bloc
  getIt.registerFactory<ArticleCubit>(() => ArticleCubit());
//use case
  getIt.registerLazySingleton<GetArticleDataUseCase>(() => GetArticleDataUseCase());
//repository
  getIt.registerLazySingleton<GetArticleDataRepository>(() => GetArticleDataRepositoryImpl());
//data source
  getIt.registerLazySingleton<ArticleRemoteDataSource>(()=>ArticleRemoteDataSourceImpl());
//! core
  getIt.registerLazySingleton<ApiConsumer>(()=>DioConsumer(client: getIt()));
//! External
  getIt.registerLazySingleton(()=>AppInterceptor());

  getIt.registerLazySingleton(()=>LogInterceptor(
    requestBody: true,
    request: true,
    requestHeader: true,
    responseBody: true,
    responseHeader: true,
    error: true,
  ));
  getIt.registerLazySingleton(()=>Dio());
}
