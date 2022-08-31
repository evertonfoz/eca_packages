import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:status_bar_control/status_bar_control.dart';

//TODO Tentar refatorar e reutilizar
hideNavigationBar() {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
}

hideStatusBarAndSetColorToNavigationBar(
    {required Color navigationBarColor}) async {
  // await StatusBarControl.setFullscreen(true);
  await StatusBarControl.setHidden(true, animation: StatusBarAnimation.SLIDE);
  await StatusBarControl.setNavigationBarColor(navigationBarColor,
      animated: true);
}

//TODO Registrar cores anteriores e manter no bind
showStatusBarAndSetColorToNavigationBar({
  Color? navigationBarColor,
  Color? statusBarColor,
  bool darkContent = true,
}) async {
  await StatusBarControl.setHidden(
    false,
    animation: StatusBarAnimation.SLIDE,
  );
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
