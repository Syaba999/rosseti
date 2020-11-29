import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_provider/mobx_provider.dart';
import 'package:rosseti/api/requests.dart';
import 'package:rosseti/models/category.dart';
import 'package:rosseti/models/proposal.dart';
import 'package:rosseti/pages/proposal/mobx/proposal_list_store.dart';
import 'package:rosseti/services/injector_service.dart';
import 'package:rosseti/services/navigator_service.dart';
import 'package:rosseti/store/user_store.dart';

part 'new_proposal_store.g.dart';

class NewProposalStore = _NewProposalStore with _$NewProposalStore;

abstract class _NewProposalStore extends MobxBase with Store {
  final _navigator =
      InjectorService.getInjector.get<NavigatorService>().navigator;
  final _userStore = InjectorService.getInjector.get<UserStore>();
  String lastId;

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
  bool showCost = false;

  @observable
  bool showTerm = false;

  @observable
  bool createsSavings = false;

  @action
  void toggleCreatesSavings() {
    createsSavings = !createsSavings;
  }

  @observable
  List<Proposal> similarityProposal = List();

  @action
  void toggleCost() => showCost = !showCost;

  @action
  void toggleTerm() => showTerm = !showTerm;

  @observable
  String selectedCategory;

  @action
  void changeCategory(String category) {
    selectedCategory = category;
  }

  List<Category> categories;

  @observable
  List<NecessaryCost> necessaryCostList = List();

  @observable
  List<RequiredTerm> requiredTermList = List();

  @observable
  List<UserRewards> usersRewardList = List();

  @action
  void removeCost(NecessaryCost row) {
    necessaryCostList = List.from(necessaryCostList)..remove(row);
  }

  @action
  void addCost() {
    //final row = NecessaryCost(
    //    necessaryCostList.isNotEmpty ? necessaryCostList.last.id + 1 : 1,
    //    costNameController.text,
    //    costTextController.text);
    costNameController.clear();
    costTextController.clear();
    //necessaryCostList = List.from(necessaryCostList)..add(row);
  }

  @action
  void removeTerm(RequiredTerm row) {
    requiredTermList = List.from(requiredTermList)..remove(row);
  }

  @action
  void addTerm() {
    //final row = ProposalRow(
    //    requiredTermList.isNotEmpty ? requiredTermList.last.id + 1 : 1,
    //    termNameController.text,
    //    termTextController.text);
    termNameController.clear();
    termTextController.clear();
    //requiredTermList = List.from(requiredTermList)..add(row);
  }

  @action
  void removeReward(UserRewards reward) {
    usersRewardList = List.from(usersRewardList)..remove(reward);
  }

  @action
  void addReward() {
    //final reward = UserRewards(
    //    rewardNameController.text, int.parse(rewardPercentController.text));
    rewardNameController.clear();
    rewardPercentController.clear();
    //usersRewardList = List.from(usersRewardList)..add(reward);
  }

  void saveProposal() async {
    print("SAVE");
    toLoadingState();
    try {
      final proposal = await ApiRequests.createProposal(
          titleController.text,
          "${DateTime.now().year}-${_userStore.getUser.company.number}-${int.parse(lastId) + 1}",
          _userStore.getUser.company.id,
          selectedCategory,
          [_userStore.getUser.id],
          problemController.text,
          solutionController.text,
          positiveController.text,
          createsSavings);
      InjectorService.getInjector
          .get<ProposalListStore>()
          .addProposal(proposal);
      _navigator.pop();
    } catch (error) {
      print(error);
    }
  }

  _titleListener() {
    if (titleController.text.length % 5 == 0) {
      _checkProposal();
    }
  }

  _problemTextListener() {
    if (problemController.text.length % 5 == 0) {
      _checkProposal();
    }
  }

  @action
  Future<void> _checkProposal() async {
    if (titleController.text.isNotEmpty && problemController.text.isNotEmpty) {
      final ids = await ApiRequests.checkProposal(
          titleController.text, problemController.text);
      if (ids != null && ids.isNotEmpty) {
        final proposals = List<Proposal>();
        for (var id in ids) {
          final proposal = await ApiRequests.fetchProposal(id.toString());
          proposals.add(proposal);
        }
        similarityProposal = proposals;
      }
      if (ids == null || ids.isEmpty) {
        similarityProposal = List();
      }
    }
  }

  void init(String lastId) async {
    toLoadingState();
    this.lastId = lastId;
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
    titleController.addListener(_titleListener);
    problemController.addListener(_problemTextListener);
    try {
      categories = await ApiRequests.fetchCategories();
      toSuccessState();
    } catch (error) {
      print(error);
    }
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
