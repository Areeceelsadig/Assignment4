import 'package:flutter_application_6/app_theme_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppThemeCubit extends Cubit<AppThemeState>{
  AppThemeCubit() : super(AppThemeState(isDark: true));

  void toggleTheme() {
    emit (AppThemeState(isDark: !state.isDark));
  }
}