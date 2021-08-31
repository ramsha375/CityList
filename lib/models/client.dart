import 'package:graphql/client.dart';

const DefaultAuthToken = "";

class GqlClient {
  HttpLink _httpLink;
  AuthLink _authLink;
  Link _link;
  GraphQLClient _client;

  GqlClient({String token}) {
    var url = "https://pulse.alpha.versify.app/";
    _httpLink = HttpLink(uri: url);
    _authLink = AuthLink(getToken: () async => token);
    _link = _authLink.concat(_httpLink);
    _client = GraphQLClient(cache: InMemoryCache(), link: _link);
  }

  graphQLErrorParser(String error) {
    return error == null ? "Something went wrong" : error.split(":")[1].trim();
  }

  Future mutate({String query, var variables}) async {
    final QueryResult result = await _client.mutate(
        MutationOptions(documentNode: gql(query), variables: variables));
    if (result.hasException) {
      return Future.error(graphQLErrorParser(result.exception.toString()));
    }
    return result.data;
  }

  Future query({String query, var variables, bool networkOnly = false}) async {
    final QueryResult result = await _client.query(QueryOptions(
        documentNode: gql(query),
        variables: variables,
        fetchPolicy: networkOnly
            ? FetchPolicy.networkOnly
            : FetchPolicy.cacheAndNetwork));
    if (result.hasException) {
      return Future.error(graphQLErrorParser(result.exception.toString()));
    }
    return result.data;
  }
}
