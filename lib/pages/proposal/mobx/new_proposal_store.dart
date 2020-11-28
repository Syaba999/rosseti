import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_provider/mobx_provider.dart';
import 'package:rosseti/models/proposal.dart';
import 'package:rosseti/services/injector_service.dart';
import 'package:rosseti/services/navigator_service.dart';
import 'package:rosseti/store/data_store.dart';

part 'new_proposal_store.g.dart';

class NewProposalStore = _NewProposalStore with _$NewProposalStore;

abstract class _NewProposalStore extends MobxBase with Store {
  final _navigator =
      InjectorService.getInjector.get<NavigatorService>().navigator;
  final _dataStore = InjectorService.getInjector.get<DataStore>();

  @override
  void dispose() {}

  TextEditingController titleController;
  TextEditingController problemController;
  TextEditingController solutionController;
  TextEditingController positiveController;
  TextEditingController costNameController;
  TextEditingController costTextController;
  TextEditingController termNameController;
  TextEditingController termTextController;
  TextEditingController rewardNameController;
  TextEditingController rewardPercentController;

  @observable
  String selectedCategory;

  @action
  void changeCategory(String category) {
    selectedCategory = category;
  }

  List<String> get categories => _dataStore.categories;

  @observable
  List<ProposalRow> necessaryCostList = List();

  @observable
  List<ProposalRow> requiredTermList = List();

  @observable
  List<UserRewards> usersRewardList = List();

  @action
  void removeCost(ProposalRow row) {
    necessaryCostList = List.from(necessaryCostList)..remove(row);
  }

  @action
  void addCost() {
    final row = ProposalRow(
        necessaryCostList.isNotEmpty ? necessaryCostList.last.id + 1 : 1,
        costNameController.text,
        costTextController.text);
    costNameController.clear();
    costTextController.clear();
    necessaryCostList = List.from(necessaryCostList)..add(row);
  }

  @action
  void removeTerm(ProposalRow row) {
    requiredTermList = List.from(requiredTermList)..remove(row);
  }

  @action
  void addTerm() {
    final row = ProposalRow(
        requiredTermList.isNotEmpty ? requiredTermList.last.id + 1 : 1,
        termNameController.text,
        termTextController.text);
    termNameController.clear();
    termTextController.clear();
    requiredTermList = List.from(requiredTermList)..add(row);
  }

  @action
  void removeReward(UserRewards reward) {
    usersRewardList = List.from(usersRewardList)..remove(reward);
  }

  @action
  void addReward() {
    final reward = UserRewards(
        rewardNameController.text, int.parse(rewardPercentController.text));
    rewardNameController.clear();
    rewardPercentController.clear();
    usersRewardList = List.from(usersRewardList)..add(reward);
  }

  @action
  void saveProposal() {
    final proposal = Proposal(
      id: _dataStore.proposalList.last.id + 1,
      createdDate: DateTime.now().toString(),
      company: "ПАО «РОССЕТИ ВОЛГА»",
      users: usersRewardList.map((e) => e.userName).toList(),
      title: titleController.text,
      category: selectedCategory,
      problemText: problemController.text,
      solutionText: solutionController.text,
      positiveText: positiveController.text,
      necessaryCosts: necessaryCostList,
      requiredTerms: requiredTermList,
      usersRewards: usersRewardList,
    );
    _dataStore.addProposal(proposal);
    _navigator.pop();
  }

  void init() async {
    toLoadingState();
    await Future.delayed(Duration(seconds: 1));
    titleController = TextEditingController();
    problemController = TextEditingController();
    solutionController = TextEditingController();
    positiveController = TextEditingController();
    costNameController = TextEditingController();
    costTextController = TextEditingController();
    termNameController = TextEditingController();
    termTextController = TextEditingController();
    rewardNameController = TextEditingController();
    rewardPercentController = TextEditingController();
    toSuccessState();
  }

  void showModal(String title, String text) {
    showDialog(
        context: _navigator.context,
        builder: (_) => new AlertDialog(
              title: new Text(title),
              content: new Text(text),
              actions: <Widget>[
                FlatButton(
                  child: Text('Ок'),
                  onPressed: () {
                    _navigator.pop();
                  },
                )
              ],
            ));
  }
}
