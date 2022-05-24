import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:status_bar_control/status_bar_control.dart';

//TODO Retirar esta classe do pacote e substituir pela função implementada
//TODO ao final
class StatusAndNavigationBarVisibilityAndColor {
  late bool _isStatusBarVisible;
  late bool _lastStatusBarVisible;
  late bool _isNavigationSystemBarVisibile;
  late bool _lastNavigationSystemBarVisible;
  late Color _androidStatusBarColor;
  late Color _androidSystemNavigatioBarColor;

  StatusAndNavigationBarVisibilityAndColor({
    bool? isStatusBarVisible = true,
    bool? isNavigationSystemBarVisibile = true,
    Color? androidStatusBarColor,
    Color? androidSystemNavigatioBarColor,
  }) {
    _isStatusBarVisible = isStatusBarVisible!;
    _isNavigationSystemBarVisibile = isNavigationSystemBarVisibile!;

    _lastStatusBarVisible = !_isStatusBarVisible;
    _lastNavigationSystemBarVisible = !_isNavigationSystemBarVisibile;

    _androidStatusBarColor = androidStatusBarColor ?? Colors.transparent;
    _androidSystemNavigatioBarColor =
        androidSystemNavigatioBarColor ?? Colors.white;

    _registerStatusBarAndNavigationBarColor();
    _registerStatusBarAndNavigationBarVisible();
  }

// #region StatusBar State and Color
  showStatusBar() {
    if (!_isStatusBarVisible) {
      _lastStatusBarVisible = false;
    }

    _isStatusBarVisible = true;

    _setStatusAndNavigationBarState();
  }

  hideStatusBar() {
    if (_isStatusBarVisible) {
      _lastStatusBarVisible = true;
    }
    _isStatusBarVisible = false;
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
    if (_isStatusBarVisible && !_lastStatusBarVisible) {
      hideStatusBar();
    } else if (!_isStatusBarVisible && _lastStatusBarVisible) {
      showStatusBar();
    }
  }
// #endregion

// #region SystemNavigationBar State and Color
  showSystemNavigationBar() {
    if (!_isNavigationSystemBarVisibile) {
      _lastNavigationSystemBarVisible = false;
    }

    _isNavigationSystemBarVisibile = true;

    _setStatusAndNavigationBarState();
  }

  hideSystemNavigationBar() {
    if (_isNavigationSystemBarVisibile) {
      _lastNavigationSystemBarVisible = true;
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
    if (_isNavigationSystemBarVisibile && !_lastNavigationSystemBarVisible) {
      hideSystemNavigationBar();
    } else if (!_isNavigationSystemBarVisibile &&
        _lastNavigationSystemBarVisible) {
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

// TODO Avaliar este problema na Home do XBusiness que não exibe a status bar
  _registerStatusBarAndNavigationBarColor() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: _getStatusBarColor(),
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarDividerColor:
          (Platform.isAndroid) ? _getSystemNavigationBarColor() : null,
      systemNavigationBarColor:
          (Platform.isAndroid) ? _getSystemNavigationBarColor() : null,
      // systemNavigationBarIconBrightness: Brightness.dark,
    ));
  }

  _registerStatusBarAndNavigationBarVisible() {
    if (_isStatusBarVisible) {
      showStatusBar();
    } else {
      hideStatusBar();
    }
    if (_isNavigationSystemBarVisibile) {
      showSystemNavigationBar();
    } else {
      hideSystemNavigationBar();
    }
  }

  _getStatusAndSystemNavigationVisibleState() {
    final List<SystemUiOverlay> _overlays = [];
    if (_isNavigationSystemBarVisibile) {
      _overlays.add(SystemUiOverlay.bottom);
    }
    if (_isStatusBarVisible) {
      _overlays.add(SystemUiOverlay.top);
    }
    return _overlays;
  }
// #endregion
}

//TODO Criado essa função para nas aplicações apenas reutilizarmos
/// Função que faz uso do pacote [status_bar_control] para alterar a visibilidade
/// da StatusBar e a cor do NavigationBar
hideStatusBarAndSetColorToNavigationBar(
    {required Color navigationBarColor}) async {
  await StatusBarControl.setFullscreen(true);
  await StatusBarControl.setHidden(true, animation: StatusBarAnimation.SLIDE);
  await StatusBarControl.setNavigationBarColor(navigationBarColor,
      animated: true);
}

showStatusBarAndSetColorToNavigationBar(
    {required Color navigationBarColor}) async {
  await StatusBarControl.setHidden(
    false,
    animation: StatusBarAnimation.SLIDE,
  );
  await StatusBarControl.setFullscreen(false);
  await StatusBarControl.setColor(
    navigationBarColor,
  );
  await StatusBarControl.setStyle(StatusBarStyle.DARK_CONTENT);
  await StatusBarControl.setNavigationBarColor(navigationBarColor,
      animated: true);
}
