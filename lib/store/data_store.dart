import 'package:mobx/mobx.dart';
import 'package:mobx_provider/mobx_provider.dart';
import 'package:rosseti/models/proposal.dart';

part 'data_store.g.dart';

class DataStore = _DataStore with _$DataStore;

abstract class _DataStore extends MobxBase with Store {
  @override
  void dispose() {}

  @observable
  List<Proposal> proposalList;

  List<String> categories;

  @action
  void addProposal(Proposal proposal) {
    proposalList = List.from(proposalList)..add(proposal);
  }

  void init() {
    categories = [
      "Управление технологическим процессом. Цифровая сеть",
      "Цифровое управление компанией",
      "Дополнительные сервисы",
      "Комплексная система информационной безопасности",
      "не относится",
    ];
    proposalList = List();
    proposalList.add(Proposal(
      id: 0,
      number: "2020-10-001",
      title: "Рацпредложение 1",
      category: categories[0],
      users: ["worker1@test.local", "worker2@test.local"],
      problemText: "Проблема рацпредложения 1",
      solutionText: "Решение рацпредложения 1",
      positiveText: "Позитивный эффект рацпредложения 1",
      necessaryCosts: [
        ProposalRow(1, "Стоимость этапа 1", "10.0"),
        ProposalRow(2, "Стоимость этапа 2", "10.0"),
      ],
      requiredTerms: [
        ProposalRow(1, "Этап1", "10 дней"),
        ProposalRow(2, "Этап2", "10 дней"),
      ],
      createdDate: "28 ноября 2020, 09:21",
      company: "ПАО «РОССЕТИ ВОЛГА»",
    ));
    proposalList.add(Proposal(
      id: 1,
      number: "2020-10-002",
      title: "Рацпредложение 2",
      category: categories[1],
      users: ["worker1@test.local", "worker2@test.local"],
      problemText: "Проблема рацпредложения 2",
      solutionText: "Решение рацпредложения 2",
      positiveText: "Позитивный эффект рацпредложения 2",
      necessaryCosts: [
        ProposalRow(1, "Стоимость этапа 1", "10.0"),
        ProposalRow(2, "Стоимость этапа 2", "10.0"),
      ],
      requiredTerms: [
        ProposalRow(1, "Этап1", "10 дней"),
        ProposalRow(2, "Этап2", "10 дней"),
      ],
      createdDate: "28 ноября 2020, 09:21",
      company: "ПАО «РОССЕТИ ВОЛГА»",
    ));
  }
}
