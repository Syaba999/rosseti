import 'package:mobx/mobx.dart';
import 'package:mobx_provider/mobx_provider.dart';
import 'package:rosseti/api/requests.dart';
import 'package:rosseti/config/routes_val.dart';
import 'package:rosseti/models/proposal.dart';
import 'package:rosseti/services/injector_service.dart';
import 'package:rosseti/services/navigator_service.dart';

part 'proposal_list_store.g.dart';

class ProposalListStore = _ProposalListStore with _$ProposalListStore;

abstract class _ProposalListStore extends MobxBase with Store {
  final _navigator =
      InjectorService.getInjector.get<NavigatorService>().navigator;

  @override
  void dispose() {}

  List<Proposal> proposalList;

  void init() {
    fetchProposalList();
  }

  Future<void> fetchProposalList() async {
    toLoadingState();
    try {
      proposalList = await ApiRequests.fetchProposalList();
      toSuccessState();
    } catch (error) {
      print(error.toString());
    }
  }

  void newProposalButtonPress() async {
    await _navigator.pushNamed(newProposalPageRoute,
        arguments: proposalList.last.id);
  }

  void addProposal(Proposal proposal) {
    proposalList.add(proposal);
  }

  void onProposalTap(Proposal proposal) {
    _navigator.pushNamed(proposalPageRoute, arguments: proposal.id);
  }
}
