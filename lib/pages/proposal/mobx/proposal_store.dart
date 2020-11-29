import 'package:mobx/mobx.dart';
import 'package:mobx_provider/mobx_provider.dart';
import 'package:rosseti/api/requests.dart';
import 'package:rosseti/models/proposal.dart';
import 'package:rosseti/services/injector_service.dart';
import 'package:rosseti/store/user_store.dart';

part 'proposal_store.g.dart';

class ProposalStore = _ProposalStore with _$ProposalStore;

abstract class _ProposalStore extends MobxBase with Store {
  final _userStore = InjectorService.getInjector.get<UserStore>();
  @override
  void dispose() {}

  @observable
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

  @action
  Future<void> likeProposal() async {
    print("LIKE ${proposal.likes}");
    proposal = proposal.copyWith(likes: proposal.likes + 1);
    print("${proposal.likes}");
    await ApiRequests.likeProposal(proposal.id, _userStore.getUser.id);
  }
}
