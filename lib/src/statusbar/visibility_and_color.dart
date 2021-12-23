import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StatusBarVisibilityAndColor {
  bool isVisible;
  bool lastVisibleStatus;
  MaterialColor androidColor;

  StatusBarVisibilityAndColor({
    required this.isVisible,
    required this.lastVisibleStatus,
    this.androidColor = Colors.indigo,
  });

  restoreStatusBarVisibleState() {
    if (isVisible && !lastVisibleStatus) {
      _hideStatusBar();
    } else if (!isVisible && lastVisibleStatus) {
      _showStatusBar();
    }
  }

  hideStatusBar() {
    if (isVisible) {
      lastVisibleStatus = true;
    }
    isVisible = false;
    _hideStatusBar();
  }

  _hideStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
  }

  showStatusBar() {
    if (!isVisible) {
      lastVisibleStatus = false;
    }

    isVisible = true;

    _showStatusBar();
  }

  _showStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }

  registerStatusBarColor({required Color color}) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: color,
      systemNavigationBarColor: (Platform.isAndroid) ? androidColor : null,
    ));
  }
}
