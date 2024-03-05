import 'package:flutter/material.dart';

extension FocusNodeExtension on FocusScopeNode {
  clearFocus() {
    FocusScopeNode currentFocus = this;
    if (!currentFocus.hasPrimaryFocus) {
      print('CURRENT FOCUS: ${currentFocus.toString()}');
      currentFocus.focusedChild?.unfocus();
    }
  }
}

extension MyThemeExtensions on ThemeData {
  BoxDecoration get myLightGlassBox =>
      BoxDecoration(
          color: colorScheme.primary.withOpacity(.3),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: colorScheme.primary));
}