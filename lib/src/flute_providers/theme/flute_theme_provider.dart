import 'package:flutter/material.dart';

import '../../../flute.dart';

abstract class FluteThemeProvider extends FluteNotifier<ThemeData> {
  FluteThemeProvider(ThemeData state) : super(state);

  void setMode(ThemeMode mode) {
    final newState = mode == ThemeMode.dark ? darkThemeData : lightThemeData;
    if (state == newState) {
      return;
    }
    emit(newState);
  }

  ThemeData get lightThemeData;
  ThemeData get darkThemeData;
}
