const String createProposalReq = r'''
mutation CreateProposal($title: String!, $number: String!, $companyId: ID!, $categoryId: ID!, $userIds: [ID!]!, $problemText: String!, $solutionText: String!, $positiveText: String!, $createsSavings: Boolean!) {
createProposal(
  title: $title,
  number: $number,
  companyId: $companyId,
  categoryId: $categoryId,
  userIds: $userIds,
  problemText: $problemText,
  solutionText: $solutionText,
  positiveText: $positiveText,
  createsSavings: $createsSavings
){
    id
    createdAt
    company {
      id
      name
    }
    category {
      id
      title
    }
    title
    users {
      id
      lastName
      firstName
      middleName
    }
  }
}
''';
