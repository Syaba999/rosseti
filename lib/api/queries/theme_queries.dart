const String getThemeList = r'''
query {
  themes {
    id
    title
    text
    direction {
      id
    }
    user {
      id
      firstName
      lastName
      middleName
    }
  }
}
''';

const String getTheme = r'''
query GetTheme($id: ID!) {
  theme(id: $id) {
    id
    title
    text
    user {
      id
      firstName
      lastName
      middleName
    }
    direction {
      id
    }
  }
}
''';
