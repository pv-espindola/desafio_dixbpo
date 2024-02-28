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