import 'package:mobx/mobx.dart';
import 'package:mobx_provider/mobx_provider.dart';
import 'package:rosseti/api/requests.dart';
import 'package:rosseti/models/proposal.dart';

part 'proposal_store.g.dart';

class ProposalStore = _ProposalStore with _$ProposalStore;

abstract class _ProposalStore extends MobxBase with Store {
  @override
  void dispose() {}

  Proposal proposal;

  void init(String id) async {
    toLoadingState();
    try {
      proposal = await ApiRequests.fetchProposal(id);
      toSuccessState();
    } catch (error) {
      print(error);
    }
  }
}
