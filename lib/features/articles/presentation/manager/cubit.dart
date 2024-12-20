import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ny_times/core/error/exceptions.dart';
import 'package:ny_times/core/usecases/usecase.dart';
import 'package:ny_times/core/utils/app_strings.dart';
import 'package:ny_times/features/articles/domain/entities/news_response_entity.dart';
import 'package:ny_times/features/articles/domain/use_cases/get_article_data_use_case.dart';
import 'package:ny_times/features/articles/presentation/manager/states.dart';
import 'package:ny_times/injection_container.dart';

class ArticleCubit extends Cubit<ArticleStates>{
  ArticleCubit():super(ArticleInitialState());


  Future<void> gerArticleData() async{
    emit(ArticleLoadingState());
    Either<Exception, NewsResponseEntity> ? response= await getIt<GetArticleDataUseCase>()(NoParams());

   response!.fold(
          (failure)=>emit(ArticleErrorState(message: _msgFailureToMsg(failure))),
          (articleResponse)=>emit(ArticleSuccessState(article: articleResponse)),
    );
  }
  String _msgFailureToMsg(Exception failure){
    switch (failure.runtimeType){
      case const (ServerException()):
        return AppStrings.serverFailure;
      default:
        return AppStrings.unExpectedError;
    }
  }
}
