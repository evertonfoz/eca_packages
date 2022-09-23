import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:status_bar_control/status_bar_control.dart';

//TODO Tentar refatorar e reutilizar
hideNavigationBar() {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
  //     overlays: [SystemUiOverlay.top]);
}

showStatusBar() {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.top]);
}

hideStatusBarAndSetColorToNavigationBar(
    {required Color navigationBarColor, bool fullScreen = true}) async {
  try {
    await StatusBarControl.setFullscreen(fullScreen);
    await StatusBarControl.setHidden(true, animation: StatusBarAnimation.SLIDE);
    await StatusBarControl.setNavigationBarColor(navigationBarColor,
        animated: true);
  } catch (e) {
    print('Erro ${e.toString()}');
  }
}

//TODO Registrar cores anteriores e manter no bind
showStatusBarAndSetColorToNavigationBar({
  Color? navigationBarColor,
  Color? statusBarColor,
  bool darkContent = true,
}) async {
  try {
    await StatusBarControl.setHidden(
      false,
      animation: StatusBarAnimation.SLIDE,
    );
  } catch (e) {
    print(e.toString());
  }
  await StatusBarControl.setFullscreen(false);
  if (navigationBarColor != null || statusBarColor != null) {
    await StatusBarControl.setColor(
      statusBarColor != null ? statusBarColor : navigationBarColor!,
    );
  }
  await StatusBarControl.setStyle(
      darkContent ? StatusBarStyle.DARK_CONTENT : StatusBarStyle.LIGHT_CONTENT);

  if (navigationBarColor != null) {
    await StatusBarControl.setNavigationBarColor(navigationBarColor,
        animated: true);
  }
}
