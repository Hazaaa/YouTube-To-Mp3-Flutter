import 'package:mobx/mobx.dart';

// Include generated file by MobX
part 'main_store.g.dart';

// This is the class used by rest of your codebase
class MainStore = _MainStore with _$MainStore;

// The store class
abstract class _MainStore with Store {
  @observable
  String videoUrl = '';

  @observable
  bool convertingInProgress = false;

  @action
  void convert() {
    convertingInProgress = true;
  }
}
