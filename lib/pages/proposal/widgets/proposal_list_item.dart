import 'package:flutter/material.dart';
import 'package:rosseti/models/proposal.dart';

class ProposalListItem extends StatelessWidget {
  final Proposal proposal;
  final Function(Proposal) onTap;

  const ProposalListItem({Key key, this.proposal, this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(proposal),
      child: Card(
        elevation: 8,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                proposal.createdDate,
                style: Theme.of(context).textTheme.caption,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "${proposal.company}",
                style: Theme.of(context)
                    .textTheme
                    .caption
                    .copyWith(color: Theme.of(context).primaryColor),
              ),
              Text("${proposal.category}"),
              Text(
                proposal.title,
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Авторы: ",
                    style: Theme.of(context).textTheme.caption,
                  ),
                  Expanded(
                      child: Wrap(
                    children: proposal.users
                        .map((e) => Text(
                              "$e, ",
                              style: Theme.of(context).textTheme.caption,
                            ))
                        .toList(),
                  )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
