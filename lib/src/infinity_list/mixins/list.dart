import 'package:eca_packages/eca_packages.dart';
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
      //TODO Mesma coisa que o de baixo
      {required String text,
      required MaterialColor loadingColor}) {
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

  Widget noItemsFoundIndicatorBuilder({
    required BuildContext context,
    required String text,
    required String urlNoData,
    double scale = 1.5,
    bool isLoading = false,
    MaterialColor? loadingColor,
    Color? background,
    Widget? widget,
    Color? textColor,
    String? subTitle,
  }) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: isLoading
          ? firstPageProgressIndicatorBuilder(
              loadingColor: loadingColor!, text: text)
          : Container(
              color: background,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  widget ??
                      Image.asset(urlNoData, //'assets/no_data.png',
                          scale: scale),
                  TextECA(
                    text: 'Nada: Ainda não temos $text para você',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: textColor ?? Colors.black,
                  ),
                  Visibility(
                    visible: subTitle != null,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextECA(
                        text: subTitle ?? '',
                        fontSize: 16,
                        // fontWeight: FontWeight.bold,
                        color: textColor ?? Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget firstPageErrorIndicatorBuilder(
      {required BuildContext context,
      required PagingController<int, Model> pagingController,
      required String assetImageURL,
      double scale = 1.5}) {
    late final String errorMessage;
    errorMessage = 'Erro inesperado ${pagingController.error?.message}';

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(assetImageURL, scale: scale),
          const SizedBox(height: 50),
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
      {required BuildContext context,
      required String text,
      required String assetImageURL,
      double scale = 1.5}) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(assetImageURL, scale: scale),
          TextECA(
            text: 'Erro: Ainda não temos $text para você',
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
