import 'package:mobx/mobx.dart';
import 'package:mobx_provider/mobx_provider.dart';
import 'package:rosseti/config/routes_val.dart';
import 'package:rosseti/models/proposal.dart';
import 'package:rosseti/services/injector_service.dart';
import 'package:rosseti/services/navigator_service.dart';
import 'package:rosseti/store/data_store.dart';

part 'proposal_list_store.g.dart';

class ProposalListStore = _ProposalListStore with _$ProposalListStore;

abstract class _ProposalListStore extends MobxBase with Store {
  final _navigator =
      InjectorService.getInjector.get<NavigatorService>().navigator;
  final _dataStore = InjectorService.getInjector.get<DataStore>();

  @override
  void dispose() {}

  @computed
  List<Proposal> get proposalList => _dataStore.proposalList;

  void init() {
    fetchProposalList();
  }

  Future<void> fetchProposalList() async {
    toLoadingState();
    await Future.delayed(Duration(seconds: 1));
    toSuccessState();
  }

  void newProposalButtonPress() {
    _navigator.pushNamed(newProposalPageRoute);
  }

  void onProposalTap(Proposal proposal) {
    _navigator.pushNamed(proposalPageRoute, arguments: proposal);
  }
}
