// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rapper_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RapperViewModel on _RapperViewModelBase, Store {
  late final _$voiceDetailsListAtom =
      Atom(name: '_RapperViewModelBase.voiceDetailsList', context: context);

  @override
  List<VoiceModel>? get voiceDetailsList {
    _$voiceDetailsListAtom.reportRead();
    return super.voiceDetailsList;
  }

  @override
  set voiceDetailsList(List<VoiceModel>? value) {
    _$voiceDetailsListAtom.reportWrite(value, super.voiceDetailsList, () {
      super.voiceDetailsList = value;
    });
  }

  late final _$selectedVoiceModelUUIDAtom = Atom(
      name: '_RapperViewModelBase.selectedVoiceModelUUID', context: context);

  @override
  String? get selectedVoiceModelUUID {
    _$selectedVoiceModelUUIDAtom.reportRead();
    return super.selectedVoiceModelUUID;
  }

  @override
  set selectedVoiceModelUUID(String? value) {
    _$selectedVoiceModelUUIDAtom
        .reportWrite(value, super.selectedVoiceModelUUID, () {
      super.selectedVoiceModelUUID = value;
    });
  }

  late final _$fetchVoiceUuidsAsyncAction =
      AsyncAction('_RapperViewModelBase.fetchVoiceUuids', context: context);

  @override
  Future<void> fetchVoiceUuids() {
    return _$fetchVoiceUuidsAsyncAction.run(() => super.fetchVoiceUuids());
  }

  late final _$_RapperViewModelBaseActionController =
      ActionController(name: '_RapperViewModelBase', context: context);

  @override
  void initService() {
    final _$actionInfo = _$_RapperViewModelBaseActionController.startAction(
        name: '_RapperViewModelBase.initService');
    try {
      return super.initService();
    } finally {
      _$_RapperViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedVoiceUUID(String? uuid) {
    final _$actionInfo = _$_RapperViewModelBaseActionController.startAction(
        name: '_RapperViewModelBase.setSelectedVoiceUUID');
    try {
      return super.setSelectedVoiceUUID(uuid);
    } finally {
      _$_RapperViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
voiceDetailsList: ${voiceDetailsList},
selectedVoiceModelUUID: ${selectedVoiceModelUUID}
    ''';
  }
}
