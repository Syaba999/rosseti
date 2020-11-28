// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DataStore on _DataStore, Store {
  final _$proposalListAtom = Atom(name: '_DataStore.proposalList');

  @override
  List<Proposal> get proposalList {
    _$proposalListAtom.reportRead();
    return super.proposalList;
  }

  @override
  set proposalList(List<Proposal> value) {
    _$proposalListAtom.reportWrite(value, super.proposalList, () {
      super.proposalList = value;
    });
  }

  final _$_DataStoreActionController = ActionController(name: '_DataStore');

  @override
  void addProposal(Proposal proposal) {
    final _$actionInfo = _$_DataStoreActionController.startAction(
        name: '_DataStore.addProposal');
    try {
      return super.addProposal(proposal);
    } finally {
      _$_DataStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
proposalList: ${proposalList}
    ''';
  }
}
