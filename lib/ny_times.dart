import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ny_times/config/routes/app_routes.dart';
import 'package:ny_times/config/themes/app_theme.dart';
import 'package:ny_times/features/articles/presentation/manager/cubit.dart';

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
              initialRoute: AppRoutes.articlePage,
              routes:AppRoutes.routes,
              theme: appTheme(),
              debugShowCheckedModeBanner: false,
            ),
          );
        });
  }
}
