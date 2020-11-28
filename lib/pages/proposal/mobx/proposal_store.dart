import 'package:mobx/mobx.dart';
import 'package:mobx_provider/mobx_provider.dart';

part 'proposal_store.g.dart';

class ProposalStore = _ProposalStore with _$ProposalStore;

abstract class _ProposalStore extends MobxBase with Store {
  @override
  void dispose() {}

  void init() {}
}
