// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStore, Store {
  final _$selectedMenuAtom = Atom(name: '_HomeStore.selectedMenu');

  @override
  int get selectedMenu {
    _$selectedMenuAtom.reportRead();
    return super.selectedMenu;
  }

  @override
  set selectedMenu(int value) {
    _$selectedMenuAtom.reportWrite(value, super.selectedMenu, () {
      super.selectedMenu = value;
    });
  }

  final _$_HomeStoreActionController = ActionController(name: '_HomeStore');

  @override
  void onMenuItemTap(int index) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.onMenuItemTap');
    try {
      return super.onMenuItemTap(index);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedMenu: ${selectedMenu}
    ''';
  }
}
