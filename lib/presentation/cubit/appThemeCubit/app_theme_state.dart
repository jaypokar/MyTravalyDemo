part of 'app_theme_cubit.dart';

abstract class AppThemeState extends Equatable {
  const AppThemeState();
}

class AppThemeInitial extends AppThemeState {
  const AppThemeInitial();

  @override
  List<Object> get props => [];
}

class LoadAppThemeState extends AppThemeState {
  final String theme;

  const LoadAppThemeState({required this.theme});

  @override
  List<Object> get props => <Object>[theme];
}
