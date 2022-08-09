import 'package:flutter/material.dart';
import 'package:status_bar_control/status_bar_control.dart';

hideStatusBarAndSetColorToNavigationBar(
    {required Color navigationBarColor}) async {
  await StatusBarControl.setFullscreen(true);
  await StatusBarControl.setHidden(true, animation: StatusBarAnimation.SLIDE);
  await StatusBarControl.setNavigationBarColor(navigationBarColor,
      animated: true);
}

showStatusBarAndSetColorToNavigationBar(
    {required Color navigationBarColor, Color? statusBarColor}) async {
  await StatusBarControl.setHidden(
    false,
    animation: StatusBarAnimation.SLIDE,
  );
  await StatusBarControl.setFullscreen(false);
  await StatusBarControl.setColor(
    statusBarColor ?? navigationBarColor,
  );
  await StatusBarControl.setStyle(StatusBarStyle.DARK_CONTENT);
  await StatusBarControl.setNavigationBarColor(navigationBarColor,
      animated: true);
}
