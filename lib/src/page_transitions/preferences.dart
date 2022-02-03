import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

const kPageTranstionsPreference = 'pageTransitions';

class PageTranstionArgs {
  final PageTransitionType pageTranstionType;
  final Alignment? alignment;

  PageTranstionArgs({required this.pageTranstionType, this.alignment});
}

class PageTranstionPreferences {
  static List<String>? _pageTranstionsDisponiveis;
  static List<String>? _pageTranstionsParaUtilizar;
  static late List<PageTranstionArgs> _pageTransitions;
  static late int _maxTranstions;

  static _generateAvailableList() {
    _populatePageTranstionsType();
    _pageTranstionsDisponiveis = <String>[];
    for (int i = 0; i < _maxTranstions; i++) {
      _pageTranstionsDisponiveis?.add(i.toString());
    }
  }

  static _generateListToUse() {
    _pageTranstionsParaUtilizar = List<String>.generate(
        _pageTranstionsDisponiveis!.length,
        (int index) => _pageTranstionsDisponiveis![index]);
  }

  static _getPreferences() async {
    if (!kIsWeb) {
      final SharedPreferences? prefs = await SharedPreferences.getInstance();
      _pageTranstionsParaUtilizar =
          prefs!.getStringList(kPageTranstionsPreference);
    }
  }

  static PageTranstionArgs _getPageTransition() {
    var random = Random();

    if (_pageTranstionsDisponiveis == null) _generateAvailableList();

    if (_pageTranstionsParaUtilizar == null ||
        _pageTranstionsParaUtilizar!.isEmpty) _generateListToUse();

    var indexPageTransitionToUse =
        random.nextInt(_pageTranstionsParaUtilizar!.length);
    if (indexPageTransitionToUse > 0) indexPageTransitionToUse--;
    var pageTransictionToUse =
        int.parse(_pageTranstionsParaUtilizar![indexPageTransitionToUse]);
    _pageTranstionsParaUtilizar!.removeAt(indexPageTransitionToUse);

    return _pageTransitions[pageTransictionToUse];
  }

  static _populatePageTranstionsType() {
    _pageTransitions = <PageTranstionArgs>[];
    _pageTransitions
        .add(PageTranstionArgs(pageTranstionType: PageTransitionType.fade));
    _pageTransitions.add(
        PageTranstionArgs(pageTranstionType: PageTransitionType.leftToRight));
    _pageTransitions.add(
        PageTranstionArgs(pageTranstionType: PageTransitionType.rightToLeft));
    _pageTransitions.add(
        PageTranstionArgs(pageTranstionType: PageTransitionType.topToBottom));
    _pageTransitions.add(
        PageTranstionArgs(pageTranstionType: PageTransitionType.bottomToTop));

    _pageTransitions.add(PageTranstionArgs(
        pageTranstionType: PageTransitionType.scale,
        alignment: Alignment.bottomCenter));
    _pageTransitions.add(PageTranstionArgs(
        pageTranstionType: PageTransitionType.scale,
        alignment: Alignment.bottomRight));
    _pageTransitions.add(PageTranstionArgs(
        pageTranstionType: PageTransitionType.scale,
        alignment: Alignment.bottomLeft));
    _pageTransitions.add(PageTranstionArgs(
        pageTranstionType: PageTransitionType.scale,
        alignment: Alignment.topRight));
    _pageTransitions.add(PageTranstionArgs(
        pageTranstionType: PageTransitionType.scale,
        alignment: Alignment.topLeft));
    _pageTransitions.add(PageTranstionArgs(
        pageTranstionType: PageTransitionType.scale,
        alignment: Alignment.topCenter));
    _pageTransitions.add(PageTranstionArgs(
        pageTranstionType: PageTransitionType.scale,
        alignment: Alignment.center));
    _pageTransitions.add(PageTranstionArgs(
        pageTranstionType: PageTransitionType.scale,
        alignment: Alignment.centerLeft));
    _pageTransitions.add(PageTranstionArgs(
        pageTranstionType: PageTransitionType.scale,
        alignment: Alignment.centerRight));

    _pageTransitions.add(PageTranstionArgs(
        pageTranstionType: PageTransitionType.rotate,
        alignment: Alignment.bottomCenter));
    _pageTransitions.add(PageTranstionArgs(
        pageTranstionType: PageTransitionType.rotate,
        alignment: Alignment.bottomRight));
    _pageTransitions.add(PageTranstionArgs(
        pageTranstionType: PageTransitionType.rotate,
        alignment: Alignment.bottomLeft));
    _pageTransitions.add(PageTranstionArgs(
        pageTranstionType: PageTransitionType.rotate,
        alignment: Alignment.topRight));
    _pageTransitions.add(PageTranstionArgs(
        pageTranstionType: PageTransitionType.rotate,
        alignment: Alignment.topLeft));
    _pageTransitions.add(PageTranstionArgs(
        pageTranstionType: PageTransitionType.rotate,
        alignment: Alignment.topCenter));
    _pageTransitions.add(PageTranstionArgs(
        pageTranstionType: PageTransitionType.rotate,
        alignment: Alignment.center));
    _pageTransitions.add(PageTranstionArgs(
        pageTranstionType: PageTransitionType.rotate,
        alignment: Alignment.centerLeft));
    _pageTransitions.add(PageTranstionArgs(
        pageTranstionType: PageTransitionType.rotate,
        alignment: Alignment.centerRight));

    _pageTransitions.add(PageTranstionArgs(
        pageTranstionType: PageTransitionType.size,
        alignment: Alignment.bottomCenter));
    _pageTransitions.add(PageTranstionArgs(
        pageTranstionType: PageTransitionType.size,
        alignment: Alignment.bottomRight));
    _pageTransitions.add(PageTranstionArgs(
        pageTranstionType: PageTransitionType.size,
        alignment: Alignment.bottomLeft));
    _pageTransitions.add(PageTranstionArgs(
        pageTranstionType: PageTransitionType.size,
        alignment: Alignment.topRight));
    _pageTransitions.add(PageTranstionArgs(
        pageTranstionType: PageTransitionType.size,
        alignment: Alignment.topLeft));
    _pageTransitions.add(PageTranstionArgs(
        pageTranstionType: PageTransitionType.size,
        alignment: Alignment.topCenter));
    _pageTransitions.add(PageTranstionArgs(
        pageTranstionType: PageTransitionType.size,
        alignment: Alignment.center));
    _pageTransitions.add(PageTranstionArgs(
        pageTranstionType: PageTransitionType.size,
        alignment: Alignment.centerLeft));
    _pageTransitions.add(PageTranstionArgs(
        pageTranstionType: PageTransitionType.size,
        alignment: Alignment.centerRight));

    _pageTransitions.add(PageTranstionArgs(
        pageTranstionType: PageTransitionType.rightToLeftWithFade));
    _pageTransitions.add(PageTranstionArgs(
        pageTranstionType: PageTransitionType.leftToRightWithFade));

    _maxTranstions = _pageTransitions.length;
  }

  static getPageTransition(RouteSettings settings, Widget route) {
    PageTranstionArgs pageTransition =
        PageTranstionPreferences._getPageTransition();

    /// Tipifiquei o retorno em String pelo fato das search pages retornarem string
    /// no pop(). Ainda é preciso repensar essa situação.
    return PageTransition<String>(
      duration: const Duration(milliseconds: 500),
      child: route,
      type: pageTransition.pageTranstionType,
      alignment: pageTransition.alignment,
      settings: settings,
    );
  }
}
