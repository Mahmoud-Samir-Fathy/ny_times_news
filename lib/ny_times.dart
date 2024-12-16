import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ny_times/config/themes/app_theme.dart';
import 'package:ny_times/features/articles/presentation/manager/cubit.dart';
import 'package:ny_times/features/articles/presentation/pages/article_page.dart';

class NyTimes extends StatelessWidget {
  const NyTimes({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: false,
        builder: (context, child) {
          return  MultiBlocProvider(
            providers: [
              BlocProvider<ArticleCubit>(
                create: (_) => ArticleCubit(),
              ),
            ],
            child: MaterialApp(
              theme: appTheme(),
              debugShowCheckedModeBanner: false,
              home: const ArticlePage(),
            ),
          );
        });
  }
}
