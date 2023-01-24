import 'package:mobx/mobx.dart';

part 'mobx_controller.g.dart';

/// flutter packages pub run build_runner build
/// flutter packages pub run build_runner build --delete-conflicting-outputs
/// flutter packages pub run build_runner watch --delete-conflicting-outputs

class ImagePickerStore = _ImagePickerStore with _$ImagePickerStore;

abstract class _ImagePickerStore with Store {
  // #region newAvatarPath
  @observable
  String? _newAvatarPath = '';

  @computed
  String get newAvatarPath => _newAvatarPath ?? '';

  @action
  registerNewAvatarPath(String value) {
    _newAvatarPath = value;
  }
  // #endregion
}
