import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../resources/app_theme.dart';

part 'app_theme_state.dart';

class AppThemeCubit extends Cubit<AppThemeState> {
  final AppTheme _appTheme;

  AppThemeCubit(this._appTheme) : super(const AppThemeInitial());

  Future<void> changeTheme(String selectedTheme) async {
    await _appTheme.changeTheme(selectedTheme);
    emit(LoadAppThemeState(theme: selectedTheme));
  }
}
