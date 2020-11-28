import 'package:graphql/client.dart';

class ApiClient {
  GraphQLClient _client;

  void init() {
    final HttpLink _httpLink = HttpLink(
      uri: 'https://api.github.com/graphql',
    );

    final AuthLink _authLink = AuthLink(
      getToken: () async => 'Bearer dsadasdasd',
    );

    final Link _link = _authLink.concat(_httpLink);

    _client = GraphQLClient(
      cache: InMemoryCache(),
      link: _link,
    );
  }

  Future<QueryResult> query(QueryOptions options) async {
    return await _client.query(options);
  }

  Future<QueryResult> mutate(MutationOptions options) async {
    return await _client.mutate(options);
  }
}
