// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MainStore on _MainStore, Store {
  late final _$videoUrlAtom =
      Atom(name: '_MainStore.videoUrl', context: context);

  @override
  String get videoUrl {
    _$videoUrlAtom.reportRead();
    return super.videoUrl;
  }

  @override
  set videoUrl(String value) {
    _$videoUrlAtom.reportWrite(value, super.videoUrl, () {
      super.videoUrl = value;
    });
  }

  late final _$convertingInProgressAtom =
      Atom(name: '_MainStore.convertingInProgress', context: context);

  @override
  bool get convertingInProgress {
    _$convertingInProgressAtom.reportRead();
    return super.convertingInProgress;
  }

  @override
  set convertingInProgress(bool value) {
    _$convertingInProgressAtom.reportWrite(value, super.convertingInProgress,
        () {
      super.convertingInProgress = value;
    });
  }

  late final _$_MainStoreActionController =
      ActionController(name: '_MainStore', context: context);

  @override
  void convert() {
    final _$actionInfo =
        _$_MainStoreActionController.startAction(name: '_MainStore.convert');
    try {
      return super.convert();
    } finally {
      _$_MainStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
videoUrl: ${videoUrl},
convertingInProgress: ${convertingInProgress}
    ''';
  }
}
