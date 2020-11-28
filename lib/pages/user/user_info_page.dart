import 'dart:io';

import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';
import 'package:mobx_provider/mobx_provider.dart';
import 'package:rosseti/pages/user/mobx/user_info_store.dart';
import 'package:rosseti/widgets/loading.dart';

class UserInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MobxStatefulObserver<UserInfoStore>(
      builder: _content,
      store: UserInfoStore(),
      initFunction: (store) => store.init(),
    );
  }

  Widget _content(BuildContext context, UserInfoStore store) {
    return Scaffold(
      body: store.isLoading
          ? Loading()
          : Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      "Необходимо заполнить поля",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Container(
                      width: !Platform.isIOS || !Platform.isAndroid
                          ? 400
                          : double.maxFinite,
                      child: Card(
                        elevation: 8,
                        margin: const EdgeInsets.all(32),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              TextField(
                                controller: store.lastNameController,
                                decoration:
                                    InputDecoration(labelText: "Фамилия"),
                              ),
                              TextField(
                                controller: store.firstNameController,
                                decoration: InputDecoration(labelText: "Имя"),
                              ),
                              TextField(
                                controller: store.middleNameController,
                                decoration:
                                    InputDecoration(labelText: "Отчество"),
                              ),
                              TextField(
                                controller: store.positionController,
                                decoration:
                                    InputDecoration(labelText: "Должность"),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              _buildDropdown(store),
                              TextField(
                                controller: store.educationController,
                                decoration:
                                    InputDecoration(labelText: "Образование"),
                              ),
                              TextField(
                                controller: store.birthYearController,
                                keyboardType: TextInputType.number,
                                decoration:
                                    InputDecoration(labelText: "Год рождения"),
                              ),
                              TextField(
                                controller: store.workExperienceController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    labelText: "Стаж работы в энергетике"),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              InkWell(
                                onTap: store.togglePers,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 18,
                                      height: 18,
                                      child: Checkbox(
                                        value: store.pers,
                                        onChanged: (value) =>
                                            store.togglePers(),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    Expanded(
                                      child: Text(
                                          "Согласие на обработку персональных данных"),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    RaisedButton(
                      child: Text("Сохранить"),
                      onPressed: store.saveButtonPress,
                    )
                  ],
                ),
              ),
            ),
    );
  }

  Widget _buildDropdown(UserInfoStore store) {
    return DropDownFormField(
      filled: false,
      contentPadding: const EdgeInsets.all(0),
      titleText: 'Организация',
      hintText: 'Выберите организацию',
      value: store.selectedDepartment,
      onChanged: store.changeDepartment,
      dataSource: store.departments
          .map((e) => {
                "display": e,
                "value": e,
              })
          .toList(),
      textField: 'display',
      valueField: 'value',
    );
  }
}
