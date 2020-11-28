// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserInfoStore on _UserInfoStore, Store {
  final _$selectedDepartmentAtom =
      Atom(name: '_UserInfoStore.selectedDepartment');

  @override
  String get selectedDepartment {
    _$selectedDepartmentAtom.reportRead();
    return super.selectedDepartment;
  }

  @override
  set selectedDepartment(String value) {
    _$selectedDepartmentAtom.reportWrite(value, super.selectedDepartment, () {
      super.selectedDepartment = value;
    });
  }

  final _$persAtom = Atom(name: '_UserInfoStore.pers');

  @override
  bool get pers {
    _$persAtom.reportRead();
    return super.pers;
  }

  @override
  set pers(bool value) {
    _$persAtom.reportWrite(value, super.pers, () {
      super.pers = value;
    });
  }

  final _$_UserInfoStoreActionController =
      ActionController(name: '_UserInfoStore');

  @override
  void togglePers() {
    final _$actionInfo = _$_UserInfoStoreActionController.startAction(
        name: '_UserInfoStore.togglePers');
    try {
      return super.togglePers();
    } finally {
      _$_UserInfoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeDepartment(String department) {
    final _$actionInfo = _$_UserInfoStoreActionController.startAction(
        name: '_UserInfoStore.changeDepartment');
    try {
      return super.changeDepartment(department);
    } finally {
      _$_UserInfoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedDepartment: ${selectedDepartment},
pers: ${pers}
    ''';
  }
}
