import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';
import 'package:mobx_provider/mobx_provider.dart';
import 'package:rosseti/config/routes_val.dart';
import 'package:rosseti/pages/proposal/mobx/new_proposal_store.dart';
import 'package:rosseti/widgets/loading.dart';

class NewProposalPage extends StatelessWidget {
  final String lastId;

  const NewProposalPage({Key key, this.lastId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MobxStatefulObserver<NewProposalStore>(
      builder: _scaffold,
      store: NewProposalStore(),
      initFunction: (store) => store.init(lastId),
    );
  }

  Widget _scaffold(BuildContext context, NewProposalStore store) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Создание рацпредложения"),
      ),
      body: _content(context, store),
    );
  }

  Widget _content(BuildContext context, NewProposalStore store) {
    if (store.isLoading) {
      return Loading();
    }
    return SingleChildScrollView(
      child: Column(
        children: [
          if (store.similarityProposal.isNotEmpty)
            Card(
              elevation: 8,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Внимание!",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Text(
                        "Обнаружены похожие предложения, рекомендуется ознакомиться с ними пред продолжением заполнения формы"),
                    SizedBox(
                      height: 8,
                    ),
                    for (var proposal in store.similarityProposal)
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(proposalPageRoute,
                              arguments: proposal.id);
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              proposal.title,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Divider(),
                          ],
                        ),
                      )
                  ],
                ),
              ),
            ),
          Card(
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: store.titleController,
                    decoration: InputDecoration(
                        labelText: "Название предложения*",
                        suffixIcon: IconButton(
                          onPressed: () => store.showModal(
                              "Название предложения",
                              "название предложения должно быть кратким, точно отражать суть и соответствовать описанию"),
                          icon: Icon(Icons.info_outline),
                        )),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  _buildDropdown(store),
                  TextField(
                    controller: store.problemController,
                    minLines: 1,
                    maxLines: 10,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                        labelText: "Опишите проблему*",
                        suffixIcon: IconButton(
                          onPressed: () => store.showModal("Опишите проблему",
                              "характеристика проблемы, которую решает рационализаторское предложение, должна описывать недостатки действующей конструкции изделия, технологии производства, применяемой техники или состава материала"),
                          icon: Icon(Icons.info_outline),
                        )),
                  ),
                  TextField(
                    controller: store.solutionController,
                    minLines: 1,
                    maxLines: 10,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                        labelText: "Опишите решение*",
                        suffixIcon: IconButton(
                          onPressed: () => store.showModal("Опишите решение",
                              "описание предлагаемого решения должно раскрывать в степени, необходимой для его практического осуществления, конструкцию, технические характеристики и другие существенные признаки предлагаемого к внедрению продукта. Прилагаются спецификации, чертежи, рисунки, фото, руководство по монтажу и наладке, руководство пользователя, дистрибутив и др. документы "),
                          icon: Icon(Icons.info_outline),
                        )),
                  ),
                  TextField(
                    controller: store.positiveController,
                    minLines: 1,
                    maxLines: 10,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                        labelText: "Ожидаемый положительный эффект*",
                        suffixIcon: IconButton(
                          onPressed: () => store.showModal(
                              "Ожидаемый положительный эффект",
                              "указывается информация об ожидаемом техническом, организационном, управленческом или ином положительном эффекте от использования. Расчет планируемой эффективности применения рационализаторского предложения готовится согласно Приложению 10 к настоящему Положению и прикладывается к заявлению"),
                          icon: Icon(Icons.info_outline),
                        )),
                  ),
                  InkWell(
                    onTap: store.toggleCreatesSavings,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 16,
                            height: 16,
                            child: Checkbox(
                              value: store.createsSavings,
                              onChanged: (value) =>
                                  store.toggleCreatesSavings(),
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: Text("Предложение создает экономию?*"),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: store.toggleCost,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 16,
                            height: 16,
                            child: Checkbox(
                              value: store.showCost,
                              onChanged: (value) => store.toggleCost(),
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: Text("Указать затраты"),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: store.toggleTerm,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 16,
                            height: 16,
                            child: Checkbox(
                              value: store.showTerm,
                              onChanged: (value) => store.toggleTerm(),
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: Text("Указать сроки"),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (store.showCost)
            Card(
              elevation: 8,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Необходимые затраты на внедрение"),
                    for (var row in store.necessaryCostList)
                      Row(
                        children: [
                          Text("${row.id}"),
                          SizedBox(
                            width: 8,
                          ),
                          //Expanded(
                          //  child: Text(row.name),
                          //),
                          SizedBox(
                            width: 8,
                          ),
                          //Expanded(
                          //  child: Text(row.text),
                          //),
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () => store.removeCost(row),
                          )
                        ],
                      ),
                    Row(
                      children: [
                        //Text(
                        //    "${store.necessaryCostList.isNotEmpty ? store.necessaryCostList.last.id + 1 : 1}"),
                        SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: TextField(
                            controller: store.costNameController,
                            decoration:
                                InputDecoration(labelText: "Статья затрат"),
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: TextField(
                            controller: store.costTextController,
                            decoration: InputDecoration(labelText: "Сумма"),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: store.addCost,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          if (store.showTerm)
            Card(
              elevation: 8,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Требуемые сроки на внедрение"),
                    for (var row in store.requiredTermList)
                      Row(
                        children: [
                          Text("${row.id}"),
                          SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: Text(row.name),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          //Expanded(
                          //  child: Text(row.text),
                          //),
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () => store.removeTerm(row),
                          )
                        ],
                      ),
                    Row(
                      children: [
                        //Text(
                        //    "${store.requiredTermList.isNotEmpty ? store.requiredTermList.last.id + 1 : 1}"),
                        SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: TextField(
                            controller: store.termNameController,
                            decoration:
                                InputDecoration(labelText: "Название этапа"),
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: TextField(
                            controller: store.termTextController,
                            decoration:
                                InputDecoration(labelText: "Срок, дней"),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: store.addTerm,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          Card(
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Укажите авторов*"),
                  for (var row in store.usersRewardList)
                    Row(
                      children: [
                        //Expanded(
                        //  child: Text(row.userName),
                        //),
                        SizedBox(
                          width: 8,
                        ),
                        //Text("${row.userPercents}"),
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () => store.removeReward(row),
                        )
                      ],
                    ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: store.rewardNameController,
                          decoration: InputDecoration(labelText: "ФИО автора"),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Container(
                        width: 50,
                        child: TextField(
                          controller: store.rewardPercentController,
                          decoration: InputDecoration(labelText: "%"),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: store.addReward,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("* - поля, обязательные для заполнения"),
          ),
          RaisedButton(
            child: Text("Сохранить"),
            onPressed: store.saveProposal,
          )
        ],
      ),
    );
  }

  Widget _buildDropdown(NewProposalStore store) {
    return DropDownFormField(
      filled: false,
      contentPadding: const EdgeInsets.all(0),
      titleText: 'Категория*',
      hintText: 'Выберите категорию',
      value: store.selectedCategory,
      onChanged: store.changeCategory,
      dataSource: store.categories
          .map((e) => {
                "display": e.title,
                "value": e.id,
              })
          .toList(),
      textField: 'display',
      valueField: 'value',
    );
  }
}
