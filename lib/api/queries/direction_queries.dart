const String getDirectionList = r'''
query {
  directions {
    id
    name
  }
}
''';

const String getDirection = r'''
query GetDirection($id: ID!) {
  direction(id: $id) {
    id
    name
    themes {
      id
      text
      title
      user {
        id
        lastName
        firstName
        middleName
      }
    }
  }
}
''';
