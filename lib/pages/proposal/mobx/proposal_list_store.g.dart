// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proposal_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProposalListStore on _ProposalListStore, Store {
  Computed<List<Proposal>> _$proposalListComputed;

  @override
  List<Proposal> get proposalList => (_$proposalListComputed ??=
          Computed<List<Proposal>>(() => super.proposalList,
              name: '_ProposalListStore.proposalList'))
      .value;

  @override
  String toString() {
    return '''
proposalList: ${proposalList}
    ''';
  }
}
