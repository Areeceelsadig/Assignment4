import 'package:flutter/material.dart';
import 'package:flutter_application_6/app_theme_state.dart';
import 'package:flutter_application_6/approuter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_theme_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppThemeCubit(),
      child: BlocBuilder<AppThemeCubit, AppThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            theme: state.isDark ? ThemeData.dark() : ThemeData.light() ,
            routerConfig: Approuter.appRouter,
          );
        },
      ),
    );
  }
}
