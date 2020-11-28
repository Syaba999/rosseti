// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_proposal_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NewProposalStore on _NewProposalStore, Store {
  final _$selectedCategoryAtom =
      Atom(name: '_NewProposalStore.selectedCategory');

  @override
  String get selectedCategory {
    _$selectedCategoryAtom.reportRead();
    return super.selectedCategory;
  }

  @override
  set selectedCategory(String value) {
    _$selectedCategoryAtom.reportWrite(value, super.selectedCategory, () {
      super.selectedCategory = value;
    });
  }

  final _$necessaryCostListAtom =
      Atom(name: '_NewProposalStore.necessaryCostList');

  @override
  List<ProposalRow> get necessaryCostList {
    _$necessaryCostListAtom.reportRead();
    return super.necessaryCostList;
  }

  @override
  set necessaryCostList(List<ProposalRow> value) {
    _$necessaryCostListAtom.reportWrite(value, super.necessaryCostList, () {
      super.necessaryCostList = value;
    });
  }

  final _$requiredTermListAtom =
      Atom(name: '_NewProposalStore.requiredTermList');

  @override
  List<ProposalRow> get requiredTermList {
    _$requiredTermListAtom.reportRead();
    return super.requiredTermList;
  }

  @override
  set requiredTermList(List<ProposalRow> value) {
    _$requiredTermListAtom.reportWrite(value, super.requiredTermList, () {
      super.requiredTermList = value;
    });
  }

  final _$usersRewardListAtom = Atom(name: '_NewProposalStore.usersRewardList');

  @override
  List<UserRewards> get usersRewardList {
    _$usersRewardListAtom.reportRead();
    return super.usersRewardList;
  }

  @override
  set usersRewardList(List<UserRewards> value) {
    _$usersRewardListAtom.reportWrite(value, super.usersRewardList, () {
      super.usersRewardList = value;
    });
  }

  final _$_NewProposalStoreActionController =
      ActionController(name: '_NewProposalStore');

  @override
  void changeCategory(String category) {
    final _$actionInfo = _$_NewProposalStoreActionController.startAction(
        name: '_NewProposalStore.changeCategory');
    try {
      return super.changeCategory(category);
    } finally {
      _$_NewProposalStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeCost(ProposalRow row) {
    final _$actionInfo = _$_NewProposalStoreActionController.startAction(
        name: '_NewProposalStore.removeCost');
    try {
      return super.removeCost(row);
    } finally {
      _$_NewProposalStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addCost() {
    final _$actionInfo = _$_NewProposalStoreActionController.startAction(
        name: '_NewProposalStore.addCost');
    try {
      return super.addCost();
    } finally {
      _$_NewProposalStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeTerm(ProposalRow row) {
    final _$actionInfo = _$_NewProposalStoreActionController.startAction(
        name: '_NewProposalStore.removeTerm');
    try {
      return super.removeTerm(row);
    } finally {
      _$_NewProposalStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addTerm() {
    final _$actionInfo = _$_NewProposalStoreActionController.startAction(
        name: '_NewProposalStore.addTerm');
    try {
      return super.addTerm();
    } finally {
      _$_NewProposalStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeReward(UserRewards reward) {
    final _$actionInfo = _$_NewProposalStoreActionController.startAction(
        name: '_NewProposalStore.removeReward');
    try {
      return super.removeReward(reward);
    } finally {
      _$_NewProposalStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addReward() {
    final _$actionInfo = _$_NewProposalStoreActionController.startAction(
        name: '_NewProposalStore.addReward');
    try {
      return super.addReward();
    } finally {
      _$_NewProposalStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void saveProposal() {
    final _$actionInfo = _$_NewProposalStoreActionController.startAction(
        name: '_NewProposalStore.saveProposal');
    try {
      return super.saveProposal();
    } finally {
      _$_NewProposalStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedCategory: ${selectedCategory},
necessaryCostList: ${necessaryCostList},
requiredTermList: ${requiredTermList},
usersRewardList: ${usersRewardList}
    ''';
  }
}
