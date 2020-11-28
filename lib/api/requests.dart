import 'package:graphql/client.dart';
import 'package:rosseti/api/api_client.dart';
import 'package:rosseti/api/queries/direction_queries.dart';
import 'package:rosseti/api/queries/proposal_queries.dart';
import 'package:rosseti/models/category.dart';
import 'package:rosseti/models/chat_theme.dart';
import 'package:rosseti/models/direction.dart';
import 'package:rosseti/models/proposal.dart';
import 'package:rosseti/models/user.dart';
import 'package:rosseti/services/injector_service.dart';

import 'api_auth_client.dart';
import 'mutations/auth_mutations.dart';
import 'mutations/proposal_mutations.dart';
import 'mutations/theme_mutations.dart';
import 'queries/theme_queries.dart';

abstract class ApiRequests {
  static final _apiAuthClient =
      InjectorService.getInjector.get<ApiAuthClient>().client;
  static final _apiClient = InjectorService.getInjector.get<ApiClient>().client;

  static Future<User> login(String email, String password) async {
    print("LOGIN");
    final options = MutationOptions(
        documentNode: gql(userLogin),
        variables: <String, dynamic>{
          'email': email,
          'password': password,
        });
    final result = await _apiAuthClient.mutate(options);
    print(result.exception.toString());
    if (result.hasException) {
      print(result.exception.toString());
      throw result.exception.graphqlErrors
          .map((e) => e.message.toString())
          .toList();
    }
    print(result.data.toString());
    return User.fromJson(result.data['userLogin']['authenticatable']);
  }

  static Future<List<Proposal>> fetchProposalList() async {
    final options = QueryOptions(documentNode: gql(getProposalList));
    final result = await _apiClient.query(options);
    if (result.hasException) {
      throw result.exception.graphqlErrors
          .map((e) => e.message.toString())
          .toList();
    }
    return (result.data["proposals"] as List)
        .map((e) => Proposal.fromJson(e))
        .toList();
  }

  static Future<Proposal> fetchProposal(String id) async {
    final options = QueryOptions(
        documentNode: gql(getProposal),
        variables: <String, dynamic>{
          'id': id,
        });
    final result = await _apiClient.query(options);
    if (result.hasException) {
      throw result.exception.graphqlErrors
          .map((e) => e.message.toString())
          .toList();
    }
    return Proposal.fromJson(result.data["proposal"]);
  }

  static Future<List<Category>> fetchCategories() async {
    final options = QueryOptions(documentNode: gql(getCategories));
    final result = await _apiClient.query(options);
    if (result.hasException) {
      throw result.exception.graphqlErrors
          .map((e) => e.message.toString())
          .toList();
    }
    return (result.data["categories"] as List)
        .map((e) => Category.fromJson(e))
        .toList();
  }

  static Future<Proposal> createProposal(
    String title,
    String number,
    String companyId,
    String categoryId,
    List<String> userIds,
    String problemText,
    String solutionText,
    String positiveText,
    bool createsSavings,
  ) async {
    final options = MutationOptions(
        documentNode: gql(createProposalReq),
        variables: <String, dynamic>{
          "title": title,
          "number": number,
          "companyId": companyId,
          "categoryId": categoryId,
          "userIds": userIds,
          "problemText": problemText,
          "solutionText": solutionText,
          "positiveText": positiveText,
          "createsSavings": createsSavings,
        });
    final result = await _apiClient.mutate(options);
    print(result.exception.toString());
    if (result.hasException) {
      print(result.exception.toString());
      throw result.exception.graphqlErrors
          .map((e) => e.message.toString())
          .toList();
    }
    print(result.data.toString());
    return Proposal.fromJson(result.data as Map<String, dynamic>);
  }

  static Future<List<Direction>> fetchDirectionList() async {
    final options = QueryOptions(documentNode: gql(getDirectionList));
    final result = await _apiClient.query(options);
    if (result.hasException) {
      print(result.exception.toString());
      throw result.exception.graphqlErrors
          .map((e) => e.message.toString())
          .toList();
    }
    return (result.data["directions"] as List)
        .map((e) => Direction.fromJson(e))
        .toList();
  }

  static Future<Direction> fetchDirection(String id) async {
    final options = QueryOptions(
        documentNode: gql(getDirection),
        variables: <String, dynamic>{
          'id': id,
        });
    final result = await _apiClient.query(options);
    if (result.hasException) {
      print(result.exception.toString());
      throw result.exception.graphqlErrors
          .map((e) => e.message.toString())
          .toList();
    }
    return Direction.fromJson(result.data["direction"]);
  }

  static Future<void> fetchChatThemeList() async {
    final options = QueryOptions(documentNode: gql(getThemeList));
    final result = await _apiClient.query(options);
    if (result.hasException) {
      print(result.exception.toString());
      throw result.exception.graphqlErrors
          .map((e) => e.message.toString())
          .toList();
    }
    return (result.data["themes"] as List)
        .map((e) => ChatTheme.fromJson(e))
        .toList();
  }

  static Future<ChatTheme> fetchChatTheme(String id) async {
    final options =
        QueryOptions(documentNode: gql(getTheme), variables: <String, dynamic>{
      'id': id,
    });
    final result = await _apiClient.query(options);
    if (result.hasException) {
      print(result.exception.toString());
      throw result.exception.graphqlErrors
          .map((e) => e.message.toString())
          .toList();
    }
    return ChatTheme.fromJson(result.data["theme"]);
  }

  static Future<String> createChatTheme(
      String title, String text, String userId, String directionId) async {
    final options = MutationOptions(
        documentNode: gql(createThemeReq),
        variables: <String, dynamic>{
          "title": title,
          "text": text,
          "userId": userId,
          "directionId": directionId
        });
    final result = await _apiClient.mutate(options);
    if (result.hasException) {
      print(result.exception.toString());
      throw result.exception.graphqlErrors
          .map((e) => e.message.toString())
          .toList();
    }
    print(result.data);
    return result.data["id"];
  }
}
