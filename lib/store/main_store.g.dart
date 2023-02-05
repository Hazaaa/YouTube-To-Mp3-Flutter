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

  late final _$videoIdAtom = Atom(name: '_MainStore.videoId', context: context);

  @override
  String get videoId {
    _$videoIdAtom.reportRead();
    return super.videoId;
  }

  @override
  set videoId(String value) {
    _$videoIdAtom.reportWrite(value, super.videoId, () {
      super.videoId = value;
    });
  }

  late final _$videoMetadataAtom =
      Atom(name: '_MainStore.videoMetadata', context: context);

  @override
  Video? get videoMetadata {
    _$videoMetadataAtom.reportRead();
    return super.videoMetadata;
  }

  @override
  set videoMetadata(Video? value) {
    _$videoMetadataAtom.reportWrite(value, super.videoMetadata, () {
      super.videoMetadata = value;
    });
  }

  late final _$actionInProgressAtom =
      Atom(name: '_MainStore.actionInProgress', context: context);

  @override
  bool get actionInProgress {
    _$actionInProgressAtom.reportRead();
    return super.actionInProgress;
  }

  @override
  set actionInProgress(bool value) {
    _$actionInProgressAtom.reportWrite(value, super.actionInProgress, () {
      super.actionInProgress = value;
    });
  }

  late final _$errorAtom = Atom(name: '_MainStore.error', context: context);

  @override
  String get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$getVideoMetadataAsyncAction =
      AsyncAction('_MainStore.getVideoMetadata', context: context);

  @override
  Future getVideoMetadata() {
    return _$getVideoMetadataAsyncAction.run(() => super.getVideoMetadata());
  }

  late final _$_MainStoreActionController =
      ActionController(name: '_MainStore', context: context);

  @override
  dynamic setVideoUrl(String enteredVideoUrl) {
    final _$actionInfo = _$_MainStoreActionController.startAction(
        name: '_MainStore.setVideoUrl');
    try {
      return super.setVideoUrl(enteredVideoUrl);
    } finally {
      _$_MainStoreActionController.endAction(_$actionInfo);
    }
  }

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
  void clearInput() {
    final _$actionInfo =
        _$_MainStoreActionController.startAction(name: '_MainStore.clearInput');
    try {
      return super.clearInput();
    } finally {
      _$_MainStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
videoUrl: ${videoUrl},
videoId: ${videoId},
videoMetadata: ${videoMetadata},
actionInProgress: ${actionInProgress},
error: ${error}
    ''';
  }
}
