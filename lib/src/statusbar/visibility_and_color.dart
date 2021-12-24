import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StatusAndNavigationBarVisibilityAndColor {
  bool _isStatusBarVisibleState = true;
  bool _lastStatusBarVisibleState = false;
  bool _isNavigationSystemBarVisibile = true;
  bool _lastNavigationSystemBarVisibleState = false;
  Color _androidStatusBarColor = Colors.transparent;
  Color _androidSystemNavigatioBarColor = Colors.white;

  StatusAndNavigationBarVisibilityAndColor() {
    _registerStatusBarAndNavigationBarColor();
  }

// #region StatusBar State and Color
  showStatusBar() {
    if (!_isStatusBarVisibleState) {
      _lastStatusBarVisibleState = false;
    }

    _isStatusBarVisibleState = true;

    _setStatusAndNavigationBarState();
  }

  hideStatusBar() {
    if (_isStatusBarVisibleState) {
      _lastStatusBarVisibleState = true;
    }
    _isStatusBarVisibleState = false;
    _setStatusAndNavigationBarState();
  }

  registerStatusBarColor({required Color color}) {
    _androidStatusBarColor = color;
    _registerStatusBarAndNavigationBarColor();
  }

  _getStatusBarColor() {
    return _androidStatusBarColor;
  }

  restoreStatusBarVisibleState() {
    if (_isStatusBarVisibleState && !_lastStatusBarVisibleState) {
      hideStatusBar();
    } else if (!_isStatusBarVisibleState && _lastStatusBarVisibleState) {
      showStatusBar();
    }
  }
// #endregion

// #region SystemNavigationBar State and Color
  showSystemNavigationBar() {
    if (!_isNavigationSystemBarVisibile) {
      _lastNavigationSystemBarVisibleState = false;
    }

    _isNavigationSystemBarVisibile = true;

    _setStatusAndNavigationBarState();
  }

  hideSystemNavigationBar() {
    if (_isNavigationSystemBarVisibile) {
      _lastNavigationSystemBarVisibleState = true;
    }
    _isNavigationSystemBarVisibile = false;
    _setStatusAndNavigationBarState();
  }

  registerNavigationBarColor({required Color color}) {
    _androidSystemNavigatioBarColor = color;
    _registerStatusBarAndNavigationBarColor();
  }

  _getSystemNavigationBarColor() {
    return _androidSystemNavigatioBarColor;
  }

  restoreSystemNavigationBarVisibleState() {
    if (_isNavigationSystemBarVisibile &&
        !_lastNavigationSystemBarVisibleState) {
      hideSystemNavigationBar();
    } else if (!_isNavigationSystemBarVisibile &&
        _lastNavigationSystemBarVisibleState) {
      showSystemNavigationBar();
    }
  }
// #endregion

// #region Both
  showBoth() {
    showStatusBar();
    showSystemNavigationBar();
  }

  _setStatusAndNavigationBarState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: _getStatusAndSystemNavigationVisibleState());
  }

  _registerStatusBarAndNavigationBarColor() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: _getStatusBarColor(),
      systemNavigationBarDividerColor:
          (Platform.isAndroid) ? _getSystemNavigationBarColor() : null,
      systemNavigationBarColor:
          (Platform.isAndroid) ? _getSystemNavigationBarColor() : null,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
  }

  _getStatusAndSystemNavigationVisibleState() {
    final List<SystemUiOverlay> _overlays = [];
    if (_isNavigationSystemBarVisibile) {
      _overlays.add(SystemUiOverlay.bottom);
    }
    if (_isStatusBarVisibleState) {
      _overlays.add(SystemUiOverlay.top);
    }
    return _overlays;
  }
// #endregion
}
