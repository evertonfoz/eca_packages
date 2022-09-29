import 'package:eca_packages/eca_packages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

failureOnFetch({
  required Failure failure,
  required BuildContext context,
  required VoidCallback? animateToCurrentPage,
  required VoidCallback? onTapToBack,
  String? notFoundException,
  required Color onHideNavigationBarColor,
  required Color onShowNavigationBarColor,
}) async {
  // Modular.get<MainAppStore>().errorWhenTryConnectToServerOccurs = true;
  await hideStatusBarAndSetColorToNavigationBar(
      navigationBarColor: onHideNavigationBarColor);
  await Future.delayed(const Duration(seconds: 1));
  if (failure is TimeOutFailure || failure is ServerFailure) {
    showBottomSnackBar(
      title: 'Informação',
      context: context,
      content: 'O servidor não está respondendo. Tente novamente mais tarde.',
      iconIndicator: Icons.error_outline,
      durationSeconds: 3,
    );
    Modular.get<MainAppStore>().errorWhenTryConnectToServerOccurs = true;
  } else if (failure is NotUniqueDataFailure) {
    showBottomSnackBar(
      title: 'Erro',
      context: context,
      content: failure.message,
      iconIndicator: Icons.error_outline,
      durationSeconds: 3,
    );
  } else if (failure is NotAuthorizedFailure) {
    showBottomSnackBar(
      title: 'Erro',
      context: context,
      content: failure.message,
      iconIndicator: Icons.error_outline,
      durationSeconds: 3,
    );
  } else if (failure is NotFoundFailure) {
    showBottomSnackBar(
      title: 'Erro',
      context: context,
      content: notFoundException ?? failure.message ?? 'Dados não encontrados.',
      iconIndicator: Icons.error_outline,
      durationSeconds: 3,
    );
  } else {
    showBottomSnackBar(
      title: 'Erro',
      context: context,
      content: 'Erro inesperado: ${failure.toString()}',
      iconIndicator: Icons.error_outline,
      durationSeconds: 3,
    );
  }
  Future.delayed(Duration.zero, () async {
    await showStatusBarAndSetColorToNavigationBar(
        navigationBarColor: onShowNavigationBarColor);
    if (onTapToBack != null) {
      onTapToBack();
    }
    if (animateToCurrentPage != null) {
      animateToCurrentPage();
    }
  });
}
