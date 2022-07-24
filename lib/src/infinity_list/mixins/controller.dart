import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

mixin ListPreferencesPageControllerMixin<Model> {
  final PagingController<int, Model> pagingController =
      PagingController(firstPageKey: 0);
}
