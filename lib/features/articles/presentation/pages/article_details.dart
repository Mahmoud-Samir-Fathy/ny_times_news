import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ny_times/core/utils/app_colors.dart';
import 'package:ny_times/core/utils/app_strings.dart';
import 'package:ny_times/features/articles/domain/entities/news_response_entity.dart';

class ArticleDetails extends StatelessWidget {
  final NewsArticleEntity article;

  const ArticleDetails({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(AppStrings.appBarText),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 8.8.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                article.title,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                article.media.isNotEmpty ? article.media[0].caption : '',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                children: [
                  Flexible(
                    child: Text(
                      'By ${article.byline}',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: AppColors.black),
                    ),
                  ),
                  const Spacer(),
                  Text(article.publishedDate,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: AppColors.black)),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                height: 300.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.r),
                  child: article.media.isNotEmpty && article.media[0].metadata.isNotEmpty && article.media[0].metadata.length > 1 ? Image(
                    image: NetworkImage(article.media[0].metadata[2].url),
                    fit: BoxFit.cover,
                  )
                      : const Image(
                    image: NetworkImage('https://www.bytesizedpieces.com/_next/image?url=https%3A%2F%2Fres.cloudinary.com%2Fbytesizedpieces%2Fimage%2Fupload%2Fv1656084931%2Farticle%2Fa-how-to-guide-on-making-an-animated-loading-image-for-a-website%2Fanimated_loader_gif_n6b5x0.gif&w=640&q=75'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Source:',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: AppColors.black)),
                  Text(article.source,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: AppColors.black)),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(article.abstractText,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: AppColors.black))
            ],
          ),
        ),
      ),
    );
  }
}
