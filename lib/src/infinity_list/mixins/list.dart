import 'package:eca_packages/eca_packages.dart';
import 'package:eca_packages/src/infinity_list/components/on_hover.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

mixin ListPreferencesMixin<Model> {
  Widget noMoreItemsIndicatorBuilder({required String text}) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        TextECA(
          text: text,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ],
    );
  }

  Widget newPageProgressIndicatorBuilder(
      {required String text, required MaterialColor loadingColor}) {
    return IndicatorProcessingCircularTextAndGif(
      loadingColor: loadingColor,
      texts: ['aguarde', 'recuperando', text],
    );
  }

  Widget firstPageProgressIndicatorBuilder(
      {required String text, required MaterialColor loadingColor}) {
    return Align(
      alignment: Alignment.center,
      child: IndicatorProcessingCircularTextAndGif(
        loadingColor: loadingColor,
        texts: ['aguarde', 'recuperando', text],
      ),
    );
  }

  Widget noItemsFoundIndicatorBuilder(
      {required BuildContext context, required String text}) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/no_data.png', scale: 1.5),
          TextECA(
            text: 'Ainda não temos $text para você',
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }

  Widget firstPageErrorIndicatorBuilder(
      {required BuildContext context,
      required PagingController<int, Model> pagingController}) {
    late final String errorMessage;
    errorMessage = 'Erro inesperado ${pagingController.error?.message}';

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/error_on_load.png', scale: 1.5),
          TextECA(
            text: errorMessage,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }

  Widget newPageErrorIndicatorBuilder(
      {required BuildContext context, required String text}) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/no_data.png', scale: 1.5),
          TextECA(
            text: 'Ainda não temos $text para você',
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }

  Widget itemBuilder({required dynamic child}) {
    return OnHover(builder: (isHovered) {
      return InkWell(
        onTap: () => {},
        child: Container(
          color: isHovered ? Colors.indigo.shade900 : Colors.transparent,
          child: child,
        ),
      );
    });
  }
}
