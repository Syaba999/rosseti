import 'package:flutter/material.dart';
import 'package:rosseti/models/proposal.dart';

class ProposalInfo extends StatelessWidget {
  final Proposal proposal;
  final Function() onLike;

  const ProposalInfo({Key key, this.proposal, this.onLike}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: double.maxFinite,
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
              SizedBox(height: 8,),
              InkWell(
                onTap: onLike,
                child: Row(
                  children: [
                    Icon(
                      Icons.thumb_up,
                      color: Theme.of(context).primaryColor,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "${proposal.likes}",
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
