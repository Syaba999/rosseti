const String getProposalList = r'''
query {
  proposals {
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

const String getProposal = r'''
query GetProposal($id: ID!) {
  proposal(id: $id) {
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
    problemText
    solutionText
    positiveText
    necessaryCosts {
      id
      costItem
      number
      sum
    }
    requiredTerms {
      id
      name
      number
      days
    }
  }
}
''';

const String getCategories = r'''
query {
  categories {
    id
    title
  }
}
''';
