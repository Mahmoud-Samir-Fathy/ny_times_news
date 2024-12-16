import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ny_times/core/error/exceptions.dart';
import 'package:ny_times/core/usecases/usecase.dart';
import 'package:ny_times/core/utils/app_strings.dart';
import 'package:ny_times/features/articles/data/models/article_model.dart';
import 'package:ny_times/features/articles/domain/use_cases/get_article_data_use_case.dart';
import 'package:ny_times/features/articles/presentation/manager/states.dart';
import 'package:ny_times/injection_container.dart';

class ArticleCubit extends Cubit<ArticleStates>{
  ArticleCubit():super(ArticleInitialState());


  Future<void> gerArticleData() async{
    emit(ArticleLoadingState());
    Either<Exception, NewsResponse> ? response= await getIt<GetArticleDataUseCase>()(NoParams());

   response!.fold(
          (failure)=>ArticleErrorState(message: _msgFailureToMsg(failure)),
          (articleResponse)=>ArticleSuccessState(article: articleResponse),
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
