import 'package:flutter/material.dart';
import 'package:mobx_provider/mobx_provider.dart';
import 'package:rosseti/models/proposal.dart';
import 'package:rosseti/pages/proposal/widgets/proposal_info.dart';
import 'package:rosseti/widgets/loading.dart';

import 'mobx/proposal_store.dart';

class ProposalPage extends StatelessWidget {
  final Proposal proposal;

  const ProposalPage({Key key, this.proposal}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MobxStatefulObserver<ProposalStore>(
      builder: _scaffold,
      store: ProposalStore(),
      initFunction: (store) => store.init(),
    );
  }

  Widget _scaffold(BuildContext context, ProposalStore store) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Рацпредложение"),
      ),
      body: _content(context, store),
    );
  }

  Widget _content(BuildContext context, ProposalStore store) {
    if (store.isLoading) {
      return Loading();
    }
    return SingleChildScrollView(
      child: Column(
        children: [
          ProposalInfo(
            proposal: proposal,
          ),
          _buildCard(context, "Описание проблемы", Text(proposal.problemText)),
          _buildCard(context, "Описание решения", Text(proposal.solutionText)),
          _buildCard(
              context, "Положительный эффект", Text(proposal.positiveText)),
          _buildCard(
              context,
              "Необходимые затраты",
              ListView.builder(
                itemCount: proposal.necessaryCosts.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (index == 0)
                      SizedBox(
                        height: 8,
                      ),
                    Text(
                        "${proposal.necessaryCosts[index].id} ${proposal.necessaryCosts[index].name} - ${proposal.necessaryCosts[index].text}"),
                    Divider(),
                  ],
                ),
              )),
          _buildCard(
              context,
              "Сроки на внедрение",
              ListView.builder(
                itemCount: proposal.requiredTerms.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (index == 0)
                      SizedBox(
                        height: 8,
                      ),
                    Text(
                        "${proposal.requiredTerms[index].id} ${proposal.requiredTerms[index].name} - ${proposal.requiredTerms[index].text}"),
                    Divider(),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildCard(BuildContext context, String title, Widget child) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headline6,
              ),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
