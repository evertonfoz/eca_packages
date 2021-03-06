import 'package:eca_packages/eca_packages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

//TODO Tirar do Signup e Login e colocar de maneira geral
failureOnFetch({
  required Failure failure,
  required BuildContext context,
  required VoidCallback? animateToCurrentPage,
  required VoidCallback? onTapToBack,
  String? notFoundException,
  required Color onHideNavigationBarColor,
  required Color onShowNavigationBarColor,
}) async {
  Modular.get<MainAppStore>().errorWhenTryConnectToServerOccurs = true;
  await hideStatusBarAndSetColorToNavigationBar(
      navigationBarColor: onHideNavigationBarColor);
  await Future.delayed(const Duration(seconds: 1));
  if (failure is TimeOutFailure || failure is ServerFailure) {
    await showModalBottomSheetToSimpleInformation(
      context: context,
      information:
          'O servidor não está respondendo. Tente novamente mais tarde.',
    );
  } else if (failure is NotUniqueDataFailure) {
    await showModalBottomSheetToSimpleInformation(
      context: context,
      information: failure.message,
    );
  } else if (failure is NotFoundFailure) {
    await showModalBottomSheetToSimpleInformation(
      context: context,
      information:
          notFoundException ?? failure.message ?? 'Dados não encontrados.',
    );
  } else {
    await showModalBottomSheetToSimpleInformation(
      context: context,
      information: 'Erro inesperado: ${failure.toString()}',
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
