import 'package:flutter/material.dart';

class OnWillPopUpNavigator {
  final GlobalKey<NavigatorState> navigatorKey;

  OnWillPopUpNavigator({required this.navigatorKey});

  canPopUp() async {
    bool? canPopNavigatorRegister = navigatorKey.currentState?.canPop();
    if (canPopNavigatorRegister!) {
      navigatorKey.currentState?.pop();
      return false;
    } else {
      return true;
    }
  }
}
