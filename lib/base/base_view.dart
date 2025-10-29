import 'package:flutter/material.dart';

abstract class BaseView<T> {
  void onError(String key);

  void showError(String errorMessage, Color color, ScaffoldState state);

  void showProgress(BuildContext context);

  void hideProgress(BuildContext context);
}
