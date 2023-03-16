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

  late final _$videoMetadataDownloadingInProgressAtom = Atom(
      name: '_MainStore.videoMetadataDownloadingInProgress', context: context);

  @override
  bool get videoMetadataDownloadingInProgress {
    _$videoMetadataDownloadingInProgressAtom.reportRead();
    return super.videoMetadataDownloadingInProgress;
  }

  @override
  set videoMetadataDownloadingInProgress(bool value) {
    _$videoMetadataDownloadingInProgressAtom
        .reportWrite(value, super.videoMetadataDownloadingInProgress, () {
      super.videoMetadataDownloadingInProgress = value;
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

  late final _$savePathAtom =
      Atom(name: '_MainStore.savePath', context: context);

  @override
  String get savePath {
    _$savePathAtom.reportRead();
    return super.savePath;
  }

  @override
  set savePath(String value) {
    _$savePathAtom.reportWrite(value, super.savePath, () {
      super.savePath = value;
    });
  }

  late final _$saveVideoAlsoAtom =
      Atom(name: '_MainStore.saveVideoAlso', context: context);

  @override
  bool get saveVideoAlso {
    _$saveVideoAlsoAtom.reportRead();
    return super.saveVideoAlso;
  }

  @override
  set saveVideoAlso(bool value) {
    _$saveVideoAlsoAtom.reportWrite(value, super.saveVideoAlso, () {
      super.saveVideoAlso = value;
    });
  }

  late final _$convertProggressPrecentageAtom =
      Atom(name: '_MainStore.convertProggressPrecentage', context: context);

  @override
  double get convertProggressPrecentage {
    _$convertProggressPrecentageAtom.reportRead();
    return super.convertProggressPrecentage;
  }

  @override
  set convertProggressPrecentage(double value) {
    _$convertProggressPrecentageAtom
        .reportWrite(value, super.convertProggressPrecentage, () {
      super.convertProggressPrecentage = value;
    });
  }

  late final _$convertCurrentStepAtom =
      Atom(name: '_MainStore.convertCurrentStep', context: context);

  @override
  String get convertCurrentStep {
    _$convertCurrentStepAtom.reportRead();
    return super.convertCurrentStep;
  }

  @override
  set convertCurrentStep(String value) {
    _$convertCurrentStepAtom.reportWrite(value, super.convertCurrentStep, () {
      super.convertCurrentStep = value;
    });
  }

  late final _$tagAtom = Atom(name: '_MainStore.tag', context: context);

  @override
  Mp3Tag? get tag {
    _$tagAtom.reportRead();
    return super.tag;
  }

  @override
  set tag(Mp3Tag? value) {
    _$tagAtom.reportWrite(value, super.tag, () {
      super.tag = value;
    });
  }

  late final _$getVideoMetadataAsyncAction =
      AsyncAction('_MainStore.getVideoMetadata', context: context);

  @override
  Future getVideoMetadata() {
    return _$getVideoMetadataAsyncAction.run(() => super.getVideoMetadata());
  }

  late final _$convertAsyncAction =
      AsyncAction('_MainStore.convert', context: context);

  @override
  Future<Result<dynamic>> convert() {
    return _$convertAsyncAction.run(() => super.convert());
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
videoMetadata: ${videoMetadata},
videoMetadataDownloadingInProgress: ${videoMetadataDownloadingInProgress},
convertingInProgress: ${convertingInProgress},
error: ${error},
savePath: ${savePath},
saveVideoAlso: ${saveVideoAlso},
convertProggressPrecentage: ${convertProggressPrecentage},
convertCurrentStep: ${convertCurrentStep},
tag: ${tag}
    ''';
  }
}
