// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gpt_response_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GPTResponseViewModel on _GPTResponseViewModelBase, Store {
  late final _$chatGptResponseAtom =
      Atom(name: '_GPTResponseViewModelBase.chatGptResponse', context: context);

  @override
  GPTMessageResponseModel? get chatGptResponse {
    _$chatGptResponseAtom.reportRead();
    return super.chatGptResponse;
  }

  @override
  set chatGptResponse(GPTMessageResponseModel? value) {
    _$chatGptResponseAtom.reportWrite(value, super.chatGptResponse, () {
      super.chatGptResponse = value;
    });
  }

  late final _$fetchGPTResponseAsyncAction = AsyncAction(
      '_GPTResponseViewModelBase.fetchGPTResponse',
      context: context);

  @override
  Future<void> fetchGPTResponse(String prompt) {
    return _$fetchGPTResponseAsyncAction
        .run(() => super.fetchGPTResponse(prompt));
  }

  late final _$_GPTResponseViewModelBaseActionController =
      ActionController(name: '_GPTResponseViewModelBase', context: context);

  @override
  void initService() {
    final _$actionInfo = _$_GPTResponseViewModelBaseActionController
        .startAction(name: '_GPTResponseViewModelBase.initService');
    try {
      return super.initService();
    } finally {
      _$_GPTResponseViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
chatGptResponse: ${chatGptResponse}
    ''';
  }
}
