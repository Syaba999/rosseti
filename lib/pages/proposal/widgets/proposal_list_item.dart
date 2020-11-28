import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rosseti/models/proposal.dart';

class ProposalListItem extends StatelessWidget {
  final Proposal proposal;
  final Function(Proposal) onTap;

  const ProposalListItem({Key key, this.proposal, this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    print(jsonEncode(proposal));
    return Card(
      elevation: 8,
      child: InkWell(
        onTap: () => onTap(proposal),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                proposal.dateFormat,
                style: Theme.of(context).textTheme.caption,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "${proposal.company.name}",
                style: Theme.of(context)
                    .textTheme
                    .caption
                    .copyWith(color: Theme.of(context).primaryColor),
              ),
              Text("${proposal.category.title}"),
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
                              "${e.fullName}, ",
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
