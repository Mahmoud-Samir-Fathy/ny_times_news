import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ny_times/core/utils/app_colors.dart';
import 'package:ny_times/core/utils/app_strings.dart';
import 'package:ny_times/features/articles/domain/entities/news_response_entity.dart';
import 'package:ny_times/features/articles/presentation/manager/cubit.dart';
import 'package:ny_times/features/articles/presentation/manager/states.dart';
import 'package:ny_times/features/articles/presentation/pages/article_details.dart';
import 'package:ny_times/injection_container.dart';

class ArticlePage extends StatelessWidget {
  const ArticlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: Text(AppStrings.appBarText),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 8.0.w),
            child: const Icon(Icons.search),
          ),
          Padding(
            padding: EdgeInsets.only(right: 8.0.w),
            child: const Icon(Icons.more_vert),
          )
        ],
      ),
      body: BlocProvider(
        create: (context) => getIt<ArticleCubit>()..gerArticleData(),
        child: BlocConsumer<ArticleCubit, ArticleStates>(
          listener: (context, state) {
          },
          builder: (context, state) {
            if (state is ArticleLoadingState) {
              return  Center(child: CircularProgressIndicator(color: AppColors.appBarColor,));
            } else if (state is ArticleSuccessState) {
              final newsResponse = state.article;
              return Column(
                children: [
                  SizedBox(height: 20.h),
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) => buildArticleItem(context, newsResponse.results[index],),
                      separatorBuilder: (context, index) => SizedBox(height: 10.h,),
                      itemCount: newsResponse.results.length,
                    ),
                  ),
                ],
              );
            } else if (state is ArticleErrorState) {
              return Center(
                child: Text(
                  state.message,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              );
            }
            return const Center(child: Text("No data available"));
          },
        ),
      ),
    );
  }
}

Widget buildArticleItem(BuildContext context, NewsArticleEntity article) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ArticleDetails(article: article),
        ),
      );
    },
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 80.h,
            width: 80.w,
            child: CircleAvatar(
              radius: 29.r,
              backgroundColor: Colors.white,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40.r),
                child: Image.network(
                article.media[0].metadata[1].url,
                  fit: BoxFit.cover,
                  height: 80.h,
                  width: 80.w,
                ),
              ),
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.title,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 15),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    'By ${article.byline}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  SizedBox(width: 30.w),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      const Spacer(),
                      Icon(
                        Icons.calendar_month,
                        color: AppColors.grey,
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        article.publishedDate,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 10.w),
          Align(
            alignment: AlignmentDirectional.center,
            child: Icon(
              Icons.arrow_forward_ios_outlined,
              color: AppColors.grey,
            ),
          ),
        ],
      ),
    ),
  );
}
