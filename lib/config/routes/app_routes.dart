import 'package:ny_times/features/articles/presentation/pages/article_page.dart';

class AppRoutes {
  static String articlePage = 'articlePage';

  static get routes {
    return {
      AppRoutes.articlePage: (context) => const ArticlePage(),
    };
  }
}
