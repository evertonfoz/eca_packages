import 'package:flutter/material.dart';

androidNavigationBaronTapToBack(
    {required BuildContext context, Function? backToPreviousPageFunction}) {
  if (FocusScope.of(context).isFirstFocus) {
    FocusScope.of(context).unfocus();
  }

  if (backToPreviousPageFunction != null) {
    backToPreviousPageFunction();
  }
}
