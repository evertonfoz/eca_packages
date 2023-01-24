bool androidBackButtonInterceptor({
  required String? routeName,
  required String? backButtonInterceptorName,
  Function()? onTapToBack,
  required bool androidBackButtonWasPressed,
}) {
  if (!androidBackButtonWasPressed &&
      routeName != null &&
      routeName == backButtonInterceptorName) {
    if (onTapToBack != null) {
      onTapToBack();
    }
  } else if (routeName == null) {
    return false;
  }

  return true;
}

// import 'package:back_button_interceptor/back_button_interceptor.dart';
// import 'package:flutter/material.dart';

// import 'mobx_controller.dart';

// // ignore: must_be_immutable
// class AndroidNavigationBackButtonECA extends StatelessWidget {
//   final AndroidNavigationBackButtonStore _androidNavigationBackButtonStore =
//       AndroidNavigationBackButtonStore();
//   final String routeNameToInterceptor;
//   final VoidCallback? executeOnTapped;
//   final Widget child;
//   late BuildContext _context;
//   static String? actualRouteName;

//   AndroidNavigationBackButtonECA({
//     Key? key,
//     required this.routeNameToInterceptor,
//     this.executeOnTapped,
//     required this.child,
//   }) : super(key: key);

//   /// Run when BackButton is tapped and it is called by
//   /// [_androidNavigationBarAddBackButtonInterceptor]
//   _androidNavigationBarOnTapToBack() {
//     if (FocusScope.of(_context).isFirstFocus) {
//       FocusScope.of(_context).unfocus();
//     }

//     if (executeOnTapped != null) {
//       executeOnTapped!();
//     }
//   }

//   /// Register de interceptor do BackBar Tap and it is called by [build]
//   _androidNavigationBarAddBackButtonInterceptor() {
//     _androidNavigationBackButtonStore.registerActualRouteName(
//         value: routeNameToInterceptor);
//     BackButtonInterceptor.add(_androidBackButtonInterceptor,
//         name: routeNameToInterceptor);
//     BackButtonInterceptor.errorProcessing = (error) {};
//   }

//   /// Register the interceptor to BackBar
//   bool _androidBackButtonInterceptor(
//       bool stopDefaultButtonEvent, RouteInfo info) {
//     if (!_androidNavigationBackButtonStore.backButtonWasPressed &&
//         BackButtonInterceptor.getCurrentNavigatorRouteName(_context) != null) {
//       _androidNavigationBarOnTapToBack();
//     } else if (BackButtonInterceptor.getCurrentNavigatorRouteName(_context) ==
//         null) {
//       return false;
//     }

//     return true;
//   }

//   static void removeInterceptorOfActualRouteName() {
//     if (actualRouteName != null) {
//       BackButtonInterceptor.removeByName(actualRouteName!);
//       actualRouteName = null;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     _context = context;
//     actualRouteName = routeNameToInterceptor;
//     // debugPrint(BackButtonInterceptor.getCurrentNavigatorRouteName(_context));

//     if (_androidNavigationBackButtonStore.actualRouteName !=
//         routeNameToInterceptor) {
//       _androidNavigationBarAddBackButtonInterceptor();
//     }
//     return child;
//   }
// }
