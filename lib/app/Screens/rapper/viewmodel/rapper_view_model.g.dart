// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rapper_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RapperViewModel on _RapperViewModelBase, Store {
  late final _$voiceListAtom =
      Atom(name: '_RapperViewModelBase.voiceList', context: context);

  @override
  ObservableList<VoiceModel> get voiceList {
    _$voiceListAtom.reportRead();
    return super.voiceList;
  }

  @override
  set voiceList(ObservableList<VoiceModel> value) {
    _$voiceListAtom.reportWrite(value, super.voiceList, () {
      super.voiceList = value;
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

  late final _$fetchVoiceDetailsAsyncAction =
      AsyncAction('_RapperViewModelBase.fetchVoiceDetails', context: context);

  @override
  Future<VoiceModel> fetchVoiceDetails(VoicesModel voiceUuidModel) {
    return _$fetchVoiceDetailsAsyncAction
        .run(() => super.fetchVoiceDetails(voiceUuidModel));
  }

  late final _$_RapperViewModelBaseActionController =
      ActionController(name: '_RapperViewModelBase', context: context);

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
voiceList: ${voiceList},
selectedVoiceModelUUID: ${selectedVoiceModelUUID}
    ''';
  }
}
