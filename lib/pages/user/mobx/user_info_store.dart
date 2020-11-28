import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_provider/mobx_provider.dart';
import 'package:rosseti/config/routes_val.dart';
import 'package:rosseti/services/injector_service.dart';
import 'package:rosseti/services/navigator_service.dart';

part 'user_info_store.g.dart';

class UserInfoStore = _UserInfoStore with _$UserInfoStore;

abstract class _UserInfoStore extends MobxBase with Store {
  final _navigator =
      InjectorService.getInjector.get<NavigatorService>().navigator;
  @override
  void dispose() {}

  TextEditingController firstNameController;
  TextEditingController lastNameController;
  TextEditingController middleNameController;
  TextEditingController positionController;
  TextEditingController educationController;
  TextEditingController birthYearController;
  TextEditingController workExperienceController;

  List<String> departments;

  @observable
  String selectedDepartment;

  @observable
  bool pers = false;

  @action
  void togglePers() {
    pers = !pers;
  }

  @action
  void changeDepartment(String department) {
    selectedDepartment = department;
  }

  void init() {
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    middleNameController = TextEditingController();
    positionController = TextEditingController();
    educationController = TextEditingController();
    birthYearController = TextEditingController();
    workExperienceController = TextEditingController();

    departments = ["ПАО «МРСК Центра»", "ПАО «РОССЕТИ ВОЛГА»"];
  }

  void saveButtonPress() async {
    if (firstNameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty &&
        middleNameController.text.isNotEmpty &&
        positionController.text.isNotEmpty &&
        educationController.text.isNotEmpty &&
        birthYearController.text.isNotEmpty &&
        workExperienceController.text.isNotEmpty &&
        selectedDepartment != null &&
        pers) {
      toLoadingState();
      await Future.delayed(Duration(seconds: 1));
      _navigator.popAndPushNamed(homePageRoute);
    }
  }
}
