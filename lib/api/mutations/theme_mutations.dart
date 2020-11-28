const String createThemeReq = r'''
mutation CreateTheme(
  $title: String!,
  $text: String!,
  $userId: ID!,
  $directionId: ID!
) {
  createTheme(
    title: $title,
    text: $text,
    userId: $userId,
    directionId: $directionId
  ) {
    id
  }
}
''';
