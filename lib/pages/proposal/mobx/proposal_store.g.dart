// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proposal_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProposalStore on _ProposalStore, Store {
  final _$proposalAtom = Atom(name: '_ProposalStore.proposal');

  @override
  Proposal get proposal {
    _$proposalAtom.reportRead();
    return super.proposal;
  }

  @override
  set proposal(Proposal value) {
    _$proposalAtom.reportWrite(value, super.proposal, () {
      super.proposal = value;
    });
  }

  final _$likeProposalAsyncAction = AsyncAction('_ProposalStore.likeProposal');

  @override
  Future<void> likeProposal() {
    return _$likeProposalAsyncAction.run(() => super.likeProposal());
  }

  @override
  String toString() {
    return '''
proposal: ${proposal}
    ''';
  }
}
