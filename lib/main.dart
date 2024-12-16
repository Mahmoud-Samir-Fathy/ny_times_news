import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ny_times/bloc_observer.dart';
import 'package:ny_times/injection_container.dart';
import 'ny_times.dart';

void main() async{
  await init();
  await ScreenUtil.ensureScreenSize();
  Bloc.observer = AppBlocObserver();
  runApp(const NyTimes());
}
