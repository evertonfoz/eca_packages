import 'package:dartz/dartz.dart';
import 'package:eca_packages/eca_packages.dart';
import 'package:flutter/cupertino.dart';

List<T> fetchListFold<T>({
  required Either<Failure, List<T>> dataToFold,
  required BuildContext context,
  VoidCallback? animateToCurrentPage,
  VoidCallback? onTapToBack,
  Color? onHideNavigationBarColor,
  Color? onShowNavigationBarColor,
}) {
  List<T> listToReturn = [];
  dataToFold.fold(
    ((failure) async {
      await failureOnFetch(
        failure: failure,
        context: context,
        animateToCurrentPage: animateToCurrentPage,
        onTapToBack: onTapToBack,
        onShowNavigationBarColor: onShowNavigationBarColor,
        onHideNavigationBarColor: onHideNavigationBarColor,
      );
    }),
    ((success) {
      listToReturn = success;
    }),
  );
  return listToReturn;
}

T? fetchSingleFold<T>({
  required Either<Failure, T> dataToFold,
  required BuildContext context,
  VoidCallback? animateToCurrentPage,
  VoidCallback? onTapToBack,
  String? notFoundException,
  required Color onHideNavigationBarColor,
  required Color onShowNavigationBarColor,
}) {
  T? objectToReturn;

  dataToFold.fold(
    ((failure) async {
      await failureOnFetch(
        failure: failure,
        context: context,
        animateToCurrentPage: animateToCurrentPage,
        onTapToBack: onTapToBack,
        notFoundException: notFoundException,
        onHideNavigationBarColor: onHideNavigationBarColor,
        onShowNavigationBarColor: onShowNavigationBarColor,
      );
    }),
    ((success) {
      objectToReturn = success;
    }),
  );
  return objectToReturn;
}
